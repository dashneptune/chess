project (chess_game)

cmake_minimum_required(VERSION 3.13)

set (CMAKE_EXPORT_COMPILE_COMMANDS ON)

# add clang stuff
include (cmake/clang.cmake)

# add Catch2
find_package(Catch2 REQUIRED)

# add CTest
include (CTest)
include (Catch)
include (cmake/test_helper.cmake)
enable_testing()

set(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} "-O3 -Wall -Wextra -Werror -Wno-c99-extensions")

add_subdirectory(src)
