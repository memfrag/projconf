//
//  Copyright (c) 2013 Martin Johannesson
//
//  Permission is hereby granted, free of charge, to any person obtaining a
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//
//  (MIT License)
//

#import <Foundation/Foundation.h>
#import <MJProjectKit/MJProjectKit.h>
#import <getopt.h>
#import "buildSettingsList.h"

#define kValidNumberOfArgumentsWithNoFlags 3
#define kValidNumberOfArgumentsSkipEmptyValues 5
#define kValidNumberOfArgumentsSkipEmptyDescriptions 7

static NSArray *buildSettingsSections;
static NSDictionary *buildSettingsList;
static BOOL skipEmptyValues;
static BOOL skipEmptyDescriptions;

static BOOL isUserDefinedVariable(NSString *name)
{
    for (NSString *sectionName in buildSettingsList.allKeys) {
        NSArray *settings = buildSettingsList[sectionName];
        for (NSString *setting in settings) {
            if ([setting isEqualToString:name]) {
                return NO;
            }
        }
    }
    
    return YES;
}

static void checkOutputPath(NSString *configPath)
{
    BOOL outputPathIsDirectory = NO;
    BOOL outputPathExists = [[NSFileManager defaultManager] fileExistsAtPath:configPath
                                                                 isDirectory:&outputPathIsDirectory];
    if (!outputPathExists) {
        NSLog(@"ERROR: Output path \"%@\" does not exist.", configPath);
        exit(1);
    }
    if (!outputPathIsDirectory) {
        NSLog(@"ERROR: Output path \"%@\" is not a directory.", configPath);
        exit(1);
    }
}

static void writeConfigFile(NSString *configPath, NSString *filename, NSString *contents)
{
    NSString *filePath = [[configPath stringByAppendingPathComponent:filename]
                                stringByAppendingPathExtension:@"xcconfig"];
    
    __autoreleasing NSError *error = nil;
    BOOL success = [contents writeToFile:filePath
                              atomically:YES
                                encoding:NSUTF8StringEncoding
                                   error:&error];
    if (!success) {
        NSLog(@"ERROR: Failed to write to file \"%@\".", filePath);
        exit(1);
    }
}

static BOOL sectionHasValues(NSArray *section, MJXCBuildConfiguration *buildConfig)
{
    for (NSString *key in section) {
        id value = buildConfig.buildSettings[key];
        if (value) {
            return YES;
        }
    }
    return NO;
}

static void writeBuildConfigToFile(MJXCBuildConfiguration *buildConfig,
                                   NSString *configPath,
                                   NSString *filename)
{
    NSMutableString *fileContents = [NSMutableString stringWithCapacity:65536];

    [fileContents appendString:@"\n// --- User Defined Settings ---\n\n"];
    for (NSString *key in buildConfig.buildSettings.allKeys) {
        if (isUserDefinedVariable(key)) {
            id value = buildConfig.buildSettings[key];
            if ([value conformsToProtocol:@protocol(NSFastEnumeration)]) {
                [fileContents appendFormat:@"%@ = ", key];
                for (NSString *entry in value) {
                    [fileContents appendFormat:@"%@ ", entry];
                }
                [fileContents appendString:@"\n"];
            } else {
                [fileContents appendFormat:@"%@ = %@\n", key, (NSString *)value];
            }
        }
    }
    
    for (NSString *sectionName in buildSettingsSections) {
        NSArray *section = buildSettingsList[sectionName];
        if (!skipEmptyDescriptions || sectionHasValues(section, buildConfig)) {
            [fileContents appendFormat:@"\n// --- %@ ---\n\n", sectionName];
        }
        
        for (NSString *key in section) {
            id value = buildConfig.buildSettings[key];
            if (value) {
                if ([value conformsToProtocol:@protocol(NSFastEnumeration)]) {
                    [fileContents appendFormat:@"%@ = ", key];
                    for (NSString *entry in value) {
                        [fileContents appendFormat:@"%@ ", entry];
                    }
                    [fileContents appendString:@"\n"];
                } else {
                    [fileContents appendFormat:@"%@ = %@\n", key, (NSString *)value];
                }
            } else {
                if (!skipEmptyValues) {
                    [fileContents appendFormat:@"  // %@ = \n", key];
                }
            }
        }
    }
    
    writeConfigFile(configPath, filename, fileContents);
}

static void extractConfigFromProjectWithURL(NSURL *projectURL, NSString *configPath)
{
    __autoreleasing NSError *error = nil;
    MJProject *projectWrapper = [MJProject projectWithContentsOfURL:projectURL
                                                              error:&error];
    if (!projectWrapper) {
        NSLog(@"ERROR: %@", error.localizedDescription);
        exit(1);
    }
    
    checkOutputPath(configPath);
    
    MJPBXProject *project = [projectWrapper.projects objectForKey:projectWrapper.rootObject];
    
    MJXCConfigurationList *projectConfigList = [projectWrapper configurationListById:project.buildConfigurationList];
    for (NSString *buildConfigUuid in projectConfigList.buildConfigurations) {
        MJXCBuildConfiguration *buildConfig = [projectWrapper buildConfigurationById:buildConfigUuid];
        NSLog(@"BUILD CONFIG: project-%@.xcconfig", buildConfig.name);
        NSString *filename = [NSString stringWithFormat:@"project-%@", buildConfig.name];
        writeBuildConfigToFile(buildConfig, configPath, filename);
    }
    
    for (NSString *targetUuid in project.targets) {
        MJPBXNativeTarget *target = [projectWrapper nativeTargetById:targetUuid];
        MJXCConfigurationList *targetConfigList = [projectWrapper configurationListById:target.buildConfigurationList];
        for (NSString *buildConfigUuid in targetConfigList.buildConfigurations) {
            MJXCBuildConfiguration *buildConfig = [projectWrapper buildConfigurationById:buildConfigUuid];
            NSLog(@"BUILD CONFIG: target-%@-%@.xcconfig", target.name, buildConfig.name);
            NSString *filename = [NSString stringWithFormat:@"target-%@-%@", target.name, buildConfig.name];
            writeBuildConfigToFile(buildConfig, configPath, filename);
        }
    }
    
    
}

static void printUsageAndExit(void)
{
    fprintf(stderr, "USAGE: projconf [-SkipEmptyValues <YES|NO>] [-SkipEmptyDescriptions <YES|NO>] "
                    "<project.pbxproj> <outputDirectory>\n");
    exit(1);
}

static void argumentIndex(NSArray *arguments, NSUInteger *projectPathIndex, NSUInteger *configPathIndex)
{
    switch (arguments.count) {
        case kValidNumberOfArgumentsWithNoFlags:
            *projectPathIndex = 1;
            *configPathIndex = 2;
            break;
        case kValidNumberOfArgumentsSkipEmptyValues:
            *projectPathIndex = 3;
            *configPathIndex = 4;
            break;
        case kValidNumberOfArgumentsSkipEmptyDescriptions:
            *projectPathIndex = 5;
            *configPathIndex = 6;
            break;
        default:
            break;
    }
}

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        NSArray *arguments = [[NSProcessInfo processInfo] arguments];
        if (arguments.count != kValidNumberOfArgumentsWithNoFlags &&
            arguments.count != kValidNumberOfArgumentsSkipEmptyValues &&
            arguments.count != kValidNumberOfArgumentsSkipEmptyDescriptions) {
            printUsageAndExit();
        }
        
        skipEmptyValues = [[NSUserDefaults standardUserDefaults] boolForKey:@"SkipEmptyValues"];
        skipEmptyDescriptions = [[NSUserDefaults standardUserDefaults] boolForKey:@"SkipEmptyDescriptions"];
        buildSettingsSections = getBuildSettingsSections();
        buildSettingsList = getBuildSettingsList();
        
        NSUInteger projectPathIndex;
        NSUInteger configPathIndex;
        argumentIndex(arguments, &projectPathIndex, &configPathIndex);
        NSString *projectPath = arguments[projectPathIndex];
        NSString *configPath = arguments[configPathIndex];
        NSURL *projectURL = [NSURL fileURLWithPath:projectPath];
        extractConfigFromProjectWithURL(projectURL, configPath);
    }
    return 0;
}

