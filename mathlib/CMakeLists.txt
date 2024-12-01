cmake_minimum_required(VERSION 3.0)

project(mathlib VERSION 1.0.0)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

add_library(mathlib SHARED
    src/mathlib.cpp
)

target_include_directories(mathlib
    PUBLIC
        ${PROJECT_SOURCE_DIR}/include/mathlib
)

add_executable(mathlib_test
    test/main.cpp
)

target_link_libraries(mathlib_test
    PRIVATE
        mathlib
)

target_compile_features(mathlib_test PRIVATE cxx_std_20)