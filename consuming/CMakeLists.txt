cmake_minimum_required(VERSION 3.15)
project(test_conan)

find_package(mathlib REQUIRED)

add_executable(${PROJECT_NAME} src/main.cpp)
target_link_libraries(${PROJECT_NAME} mathlib::mathlib)