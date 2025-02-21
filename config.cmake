# include this file at the top level CMakeLists.txt

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


add_compile_options(
    -g 
    -O0 
    -Wall  
    -Wextra 
    --std=gnu++20
    -fsanitize=address
    -fprofile-arcs -ftest-coverage
)
    
add_link_options(
    -fsanitize=address
    -lgcov --coverage
)

# google test config
include(FetchContent)
    FetchContent_Declare(
        googletest
        URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)
FetchContent_MakeAvailable(googletest)
include(CTest)