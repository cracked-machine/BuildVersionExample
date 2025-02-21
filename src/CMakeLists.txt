
include_directories(${CMAKE_SOURCE_DIR}/inc)

add_executable(BuildVersionProject
    ${CMAKE_SOURCE_DIR}/src/main.cpp
)

if(DEFINED ENV{BUILD_VERSION})
    message("Imported Build Version: $ENV{BUILD_VERSION}")
    target_compile_definitions(BuildVersionProject PRIVATE BUILD_VERSION=$ENV{BUILD_VERSION})
endif()
