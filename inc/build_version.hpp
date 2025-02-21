#ifndef __BUILD_VERSION_HPP__
#define __BUILD_VERSION_HPP__

#include <string>
#include <iostream>

#define STRINGIZER(arg)     #arg
#define STR_VALUE(arg)      STRINGIZER(arg)
#define BUILD_VERSION_STRING STR_VALUE(BUILD_VERSION)

#ifndef BUILD_VERSION
    #error "BUILD_VERSION is undefined. BUILD_VERSION must be passed into target_compile_definitions."
#endif

const std::string version = BUILD_VERSION_STRING; 



#endif //  __BUILD_VERSION_HPP__