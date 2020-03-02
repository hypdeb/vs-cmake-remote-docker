# CMakeList.txt : CMake project for cpp-sandbox, include source and define
# project specific logic here.
#
cmake_minimum_required (VERSION 3.16)
find_package(Threads)
# Add source to this project's executable.
add_executable (cpp-sandbox "cpp-sandbox.cpp" "cpp-sandbox.h")
target_link_libraries (cpp-sandbox ${CMAKE_THREAD_LIBS_INIT})

# TODO: Add tests and install targets if needed.
