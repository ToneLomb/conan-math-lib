cmake_minimum_required(VERSION 3.15)
project(PackageTest CXX)

find_package(mathlib CONFIG REQUIRED)

add_executable(test src/main.cpp)
target_link_libraries(test mathlib::mathlib)
