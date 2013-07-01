# projconf

A Mac OS X command line tool for extracting build settings from Xcode project files and generating .xcconfig files containing the build settings.

Licensed under the MIT license.

# System Requirements

This application uses Objective-C literals and therefore it must be compiled with OS X 10.8+.

# Building

1. Clone the repo.
2. Update the submodules:

    `git submodule update --init --recursive`

3. Run build script:

    `./build.sh`

4. The `projconf` binary is now in the `build/` subdirectory.

# Using

    projconf <projectFile.pbxproj> <outputDirectory>

Example:

    mkdir /tmp/configfiles
    ./projconf /path/to/someproject.xcodeproj/project.pbxproj /tmp/configfiles

# Results

There will be one project level xcconfig file for each configuration (Debug, Release, etc) and
one target level xconfig file for each target and configuration pair.

Let's say that the project has two configurations; Debug and Release. The project also has two targets;
targetA and targetB. Then the following files will be generated:

    buildconfig-Debug.xcconfig
    buildconfig-Release.xcconfig
    target-targetA-Debug.xcconfig
    target-targetA-Release.xcconfig
    target-targetB-Debug.xcconfig
    target-targetB-Release.xcconfig

# File Contents

The xcconfig file contains all user defined build setting variables from the project file,
as well as the standard build setting variables defined by Xcode. The output is divided
into the same sections as the build settings sections in Xcode and any standard build setting
variable that isn't set by the project file is still included in the xcconfig file, but commented
out. This is for convenience if they will be set at a later time when all the configuration is
done from the xcconfig file.

Here's an example snippet from the Architectures section from a generated xcconfig file.

    // --- Architectures ---
    
      // ADDITIONAL_SDKS = 
    ARCHS = armv7
    SDKROOT = iphoneos5.1
    ONLY_ACTIVE_ARCH = NO
      // SUPPORTED_PLATFORMS = 
    VALID_ARCHS = armv7

In this example, `ADDITIONAL_SDKS` and `SUPPORTED_PLATFORMS` have not been configured in the project file,
and thus they are commented out.
