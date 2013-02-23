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

#import "buildSettingsList.h"

NSArray *getBuildSettingsSections(void)
{
    return @[
             @"Architectures",
             @"Build Locations",
             @"Build Options",
             @"Code Signing",
             @"Deployment",
             @"Kernel Module",
             @"Linking",
             @"Packaging",
             @"Search Paths",
             @"Unit Testing",
             @"Versioning",
             @"Apple LLVM compiler - Code Generation",
             @"Apple LLVM compiler - Language",
             @"Apple LLVM compiler - Preprocessing",
             @"Apple LLVM compiler - Warning Policies",
             @"Apple LLVM compiler - Warnings - All languages",
             @"Apple LLVM compiler - Warnings - C++",
             @"Apple LLVM compiler - Warnings - Objective-C",
             @"Interface Builder XIB Compiler - Options",
             @"OSACompile - Build Options",
             @"Static Analyzer - Checks",
             @"Static Analyzer - Checks - Objective-C",
             @"Static Analyzer - Checks - Security"
             ];
}


NSDictionary *getBuildSettingsList(void)
{
  return @{
    @"Architectures" : @[
            @"ADDITIONAL_SDKS",
            @"ARCHS",
            @"SDKROOT",
            @"ONLY_ACTIVE_ARCH",
            @"SUPPORTED_PLATFORMS",
            @"VALID_ARCHS"
            ],
    @"Build Locations" : @[
            @"SYMROOT",
            @"OBJROOT",
            @"CONFIGURATION_BUILD_DIR",
            @"CONFIGURATION_TEMP_DIR",
            @"SHARED_PRECOMPS_DIR"
            ],
    @"Build Options" : @[
            @"BUILD_VARIANTS",
            @"GCC_VERSION",
            @"DEBUG_INFORMATION_FORMAT",
            @"GENERATE_PROFILING_CODE",
            @"PRECOMPS_INCLUDE_HEADERS_FROM_BUILT_PRODUCTS_DIR",
            @"RUN_CLANG_STATIC_ANALYZER",
            @"SCAN_ALL_SOURCE_FILES_FOR_INCLUDES",
            @"VALIDATE_PRODUCT"
            ],
    @"Code Signing" : @[
            @"CODE_SIGN_ENTITLEMENTS",
            @"CODE_SIGN_IDENTITY",
            @"CODE_SIGN_RESOURCE_RULES_PATH",
            @"OTHER_CODE_SIGN_FLAGS"
            ],
    @"Deployment" : @[
            @"STRIPFLAGS",
            @"ALTERNATE_GROUP",
            @"ALTERNATE_OWNER",
            @"ALTERNATE_MODE",
            @"ALTERNATE_PERMISSIONS_FILES",
            @"DEPLOYMENT_LOCATION",
            @"DEPLOYMENT_POSTPROCESSING",
            @"INSTALL_GROUP",
            @"INSTALL_OWNER",
            @"INSTALL_MODE_FLAG",
            @"DSTROOT",
            @"INSTALL_PATH",
            @"MACOSX_DEPLOYMENT_TARGET",
            @"SKIP_INSTALL",
            @"COPY_PHASE_STRIP",
            @"STRIP_INSTALLED_PRODUCT",
            @"STRIP_STYLE",
            @"TARGETED_DEVICE_FAMILY",
            @"SEPARATE_STRIP",
            @"IPHONEOS_DEPLOYMENT_TARGET"
            ],
    @"Kernel Module" : @[
            @"MODULE_NAME",
            @"MODULE_START",
            @"MODULE_STOP",
            @"MODULE_VERSION"
            ],
    @"Linking" : @[
            @"BUNDLE_LOADER",
            @"DYLIB_COMPATIBILITY_VERSION",
            @"DYLIB_CURRENT_VERSION",
            @"DEAD_CODE_STRIPPING",
            @"LINKER_DISPLAYS_MANGLED_NAMES",
            @"LD_NO_PIE",
            @"PRESERVE_DEAD_CODE_INITS_AND_TERMS",
            @"LD_DYLIB_INSTALL_NAME",
            @"EXPORTED_SYMBOLS_FILE",
            @"INIT_ROUTINE",
            @"LINK_WITH_STANDARD_LIBRARIES",
            @"MACH_O_TYPE",
            @"ORDER_FILE",
            @"OTHER_LDFLAGS",
            @"LD_MAP_FILE_PATH",
            @"GENERATE_MASTER_OBJECT_FILE",
            @"PRELINK_LIBS",
            @"KEEP_PRIVATE_EXTERNS",
            @"LD_RUNPATH_SEARCH_PATHS",
            @"SEPARATE_SYMBOL_EDIT",
            @"PRELINK_FLAGS",
            @"SECTORDER_FLAGS",
            @"UNEXPORTED_SYMBOLS_FILE",
            @"WARNING_LDFLAGS",
            @"LD_GENERATE_MAP_FILE"
            ],
    @"Packaging" : @[
            @"COMPRESS_PNG_FILES",
            @"APPLY_RULES_IN_COPY_FILES",
            @"EXECUTABLE_EXTENSION",
            @"EXECUTABLE_PREFIX",
            @"INFOPLIST_EXPAND_BUILD_SETTINGS",
            @"GENERATE_PKGINFO_FILE",
            @"FRAMEWORK_VERSION",
            @"INFOPLIST_FILE",
            @"INFOPLIST_OTHER_PREPROCESSOR_FLAGS",
            @"INFOPLIST_OUTPUT_FORMAT",
            @"INFOPLIST_PREPROCESSOR_DEFINITIONS",
            @"INFOPLIST_PREFIX_HEADER",
            @"INFOPLIST_PREPROCESS",
            @"COPYING_PRESERVES_HFS_DATA",
            @"PRIVATE_HEADERS_FOLDER_PATH",
            @"PRODUCT_NAME",
            @"PLIST_FILE_OUTPUT_FORMAT",
            @"PUBLIC_HEADERS_FOLDER_PATH",
            @"STRINGS_FILE_OUTPUT_ENCODING",
            @"WRAPPER_EXTENSION"
            ],
    @"Search Paths" : @[
            @"ALWAYS_SEARCH_USER_PATHS",
            @"FRAMEWORK_SEARCH_PATHS",
            @"HEADER_SEARCH_PATHS",
            @"LIBRARY_SEARCH_PATHS",
            @"REZ_SEARCH_PATHS",
            @"EXCLUDED_RECURSIVE_SEARCH_PATH_SUBDIRECTORIES",
            @"INCLUDED_RECURSIVE_SEARCH_PATH_SUBDIRECTORIES",
            @"USER_HEADER_SEARCH_PATHS"
            ],
    @"Unit Testing" : @[
            @"OTHER_TEST_FLAGS",
            @"TEST_AFTER_BUILD",
            @"TEST_HOST",
            @"TEST_RIG"
            ],
    @"Versioning" : @[
            @"CURRENT_PROJECT_VERSION",
            @"VERSION_INFO_FILE",
            @"VERSION_INFO_EXPORT_DECL",
            @"VERSION_INFO_PREFIX",
            @"VERSION_INFO_SUFFIX",
            @"VERSIONING_SYSTEM",
            @"VERSION_INFO_BUILDER"
            ],
    @"Apple LLVM compiler - Code Generation" : @[
            @"GCC_FAST_OBJC_DISPATCH",
            @"CLANG_X86_VECTOR_INSTRUCTIONS",
            @"GCC_STRICT_ALIASING",
            @"GCC_GENERATE_DEBUGGING_SYMBOLS",
            @"GCC_DYNAMIC_NO_PIC",
            @"GCC_GENERATE_TEST_COVERAGE_FILES",
            @"GCC_INLINES_ARE_PRIVATE_EXTERN",
            @"GCC_INSTRUMENT_PROGRAM_FLOW_ARCS",
            @"GCC_ENABLE_KERNEL_DEVELOPMENT",
            @"LLVM_LTO",
            @"GCC_REUSE_STRINGS",
            @"GCC_NO_COMMON_BLOCKS",
            @"GCC_OPTIMIZATION_LEVEL",
            @"GCC_FAST_MATH",
            @"GCC_THREADSAFE_STATICS",
            @"GCC_SYMBOLS_PRIVATE_EXTERN",
            @"GCC_UNROLL_LOOPS"
            ],
    @"Apple LLVM compiler - Language" : @[
            @"GCC_CHAR_IS_UNSIGNED_CHAR",
            @"GCC_ENABLE_ASM_KEYWORD",
            @"GCC_C_LANGUAGE_STANDARD",
            @"CLANG_CXX_LANGUAGE_STANDARD",
            @"CLANG_CXX_LIBRARY",
            @"GCC_CW_ASM_SYNTAX",
            @"GCC_INPUT_FILETYPE",
            @"GCC_ENABLE_CPP_EXCEPTIONS",
            @"GCC_ENABLE_CPP_RTTI",
            @"GCC_LINK_WITH_DYNAMIC_LIBRARIES",
            @"GCC_ENABLE_OBJC_EXCEPTIONS",
            @"GCC_ENABLE_TRIGRAPHS",
            @"GCC_ENABLE_FLOATING_POINT_LIBRARY_CALLS",
            @"GCC_USE_INDIRECT_FUNCTION_CALLS",
            @"GCC_USE_REGISTER_FUNCTION_CALLS",
            @"CLANG_LINK_OBJC_RUNTIME",
            @"GCC_INCREASE_PRECOMPILED_HEADER_SHARING",
            @"CLANG_ENABLE_OBJC_ARC",
            @"OTHER_CFLAGS",
            @"OTHER_CPLUSPLUSFLAGS",
            @"GCC_PRECOMPILE_PREFIX_HEADER",
            @"GCC_PREFIX_HEADER",
            @"GCC_ENABLE_BUILTIN_FUNCTIONS",
            @"GCC_ENABLE_PASCAL_STRINGS",
            @"GCC_SHORT_ENUMS",
            @"GCC_USE_STANDARD_INCLUDE_SEARCHING"
            ],
    @"Apple LLVM compiler - Preprocessing" : @[
            @"GCC_PREPROCESSOR_DEFINITIONS",
            @"GCC_PREPROCESSOR_DEFINITIONS_NOT_USED_IN_PRECOMPS"
            ],
    @"Apple LLVM compiler - Warning Policies" : @[
            @"GCC_WARN_INHIBIT_ALL_WARNINGS",
            @"GCC_WARN_PEDANTIC",
            @"GCC_TREAT_WARNINGS_AS_ERRORS"
            ],
    @"Apple LLVM compiler - Warnings - All languages" : @[
            @"GCC_WARN_CHECK_SWITCH_STATEMENTS",
            @"GCC_WARN_ABOUT_DEPRECATED_FUNCTIONS",
            @"CLANG_WARN_EMPTY_BODY",
            @"GCC_WARN_FOUR_CHARACTER_CONSTANTS",
            @"GCC_WARN_SHADOW",
            @"CLANG_WARN_CONSTANT_CONVERSION",
            @"GCC_WARN_64_TO_32_BIT_CONVERSION",
            @"CLANG_WARN_ENUM_CONVERSION",
            @"CLANG_WARN_INT_CONVERSION",
            @"CLANG_WARN_IMPLICIT_SIGN_CONVERSION",
            @"GCC_WARN_INITIALIZER_NOT_FULLY_BRACKETED",
            @"GCC_WARN_ABOUT_RETURN_TYPE",
            @"GCC_WARN_MISSING_PARENTHESES",
            @"GCC_WARN_ABOUT_MISSING_FIELD_INITIALIZERS",
            @"GCC_WARN_ABOUT_MISSING_PROTOTYPES",
            @"GCC_WARN_ABOUT_MISSING_NEWLINE",
            @"WARNING_CFLAGS",
            @"GCC_WARN_ABOUT_POINTER_SIGNEDNESS",
            @"GCC_WARN_SIGN_COMPARE",
            @"CLANG_WARN_SUSPICIOUS_IMPLICIT_CONVERSION",
            @"GCC_TREAT_INCOMPATIBLE_POINTER_TYPE_WARNINGS_AS_ERRORS",
            @"GCC_TREAT_IMPLICIT_FUNCTION_DECLARATIONS_AS_ERRORS",
            @"GCC_WARN_TYPECHECK_CALLS_TO_PRINTF",
            @"GCC_WARN_UNINITIALIZED_AUTOS",
            @"GCC_WARN_UNKNOWN_PRAGMAS",
            @"GCC_WARN_UNUSED_FUNCTION",
            @"GCC_WARN_UNUSED_LABEL",
            @"GCC_WARN_UNUSED_PARAMETER",
            @"GCC_WARN_UNUSED_VALUE",
            @"GCC_WARN_UNUSED_VARIABLE"
            ],
    @"Apple LLVM compiler - Warnings - C++" : @[
            @"CLANG_WARN__EXIT_TIME_DESTRUCTORS",
            @"GCC_WARN_NON_VIRTUAL_DESTRUCTOR",
            @"GCC_WARN_HIDDEN_VIRTUAL_FUNCTIONS",
            @"GCC_WARN_ABOUT_INVALID_OFFSETOF_MACRO",
            @"CLANG_WARN_CXX0X_EXTENSIONS"
            ],
    @"Apple LLVM compiler - Warnings - Objective-C" : @[
            @"CLANG_WARN__DUPLICATE_METHOD_MATCH",
            @"CLANG_WARN_OBJC_IMPLICIT_ATOMIC_PROPERTIES",
            @"CLANG_WARN_OBJC_MISSING_PROPERTY_SYNTHESIS",
            @"GCC_WARN_ALLOW_INCOMPLETE_PROTOCOL",
            @"GCC_WARN_MULTIPLE_DEFINITION_TYPES_FOR_SELECTOR",
            @"CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS",
            @"CLANG_WARN_OBJC_RECEIVER_WEAK",
            @"GCC_WARN_STRICT_SELECTOR_MATCH",
            @"GCC_WARN_UNDECLARED_SELECTOR",
            @"CLANG_WARN__ARC_BRIDGE_CAST_NONARC"
            ],
    @"Interface Builder XIB Compiler - Options" : @[
            @"IBC_FLATTEN_NIBS",
            @"IBC_OTHER_FLAGS",
            @"IBC_OVERRIDING_PLUGINS_AND_FRAMEWORKS_DIR",
            @"IBC_PLUGIN_SEARCH_PATHS",
            @"IBC_PLUGINS",
            @"IBC_ERRORS",
            @"IBC_NOTICES",
            @"IBC_WARNINGS"
            ],
    @"OSACompile - Build Options" : @[
            @"OTHER_OSACOMPILEFLAGS",
            @"OSACOMPILE_EXECUTE_ONLY"
            ],
    @"Static Analyzer - Checks" : @[
            @"CLANG_ANALYZER_DEADCODE_DEADSTORES",
            @"CLANG_ANALYZER_GCD",
            @"CLANG_ANALYZER_MALLOC"
            ],
    @"Static Analyzer - Checks - Objective-C" : @[
            @"CLANG_ANALYZER_OBJC_ATSYNC",
            @"CLANG_ANALYZER_OBJC_NSCFERROR",
            @"CLANG_ANALYZER_OBJC_INCOMP_METHOD_TYPES",
            @"CLANG_ANALYZER_OBJC_CFNUMBER",
            @"CLANG_ANALYZER_OBJC_COLLECTIONS",
            @"CLANG_ANALYZER_OBJC_UNUSED_IVARS",
            @"CLANG_ANALYZER_OBJC_SELF_INIT",
            @"CLANG_ANALYZER_OBJC_RETAIN_COUNT"
            ],
    @"Static Analyzer - Checks - Security" : @[
            @"CLANG_ANALYZER_SECURITY_FLOATLOOPCOUNTER",
            @"CLANG_ANALYZER_SECURITY_KEYCHAIN_API",
            @"CLANG_ANALYZER_SECURITY_INSECUREAPI_UNCHECKEDRETURN",
            @"CLANG_ANALYZER_SECURITY_INSECUREAPI_GETPW_GETS",
            @"CLANG_ANALYZER_SECURITY_INSECUREAPI_MKSTEMP",
            @"CLANG_ANALYZER_SECURITY_INSECUREAPI_RAND",
            @"CLANG_ANALYZER_SECURITY_INSECUREAPI_STRCPY",
            @"CLANG_ANALYZER_SECURITY_INSECUREAPI_VFORK"
            ]
    };
}
