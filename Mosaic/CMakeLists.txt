cmake_minimum_required(VERSION 3.6)
project(Mosaic)

find_package(OPENCV)
include_directories( ${OpenCV_INCLUDE_DIRS} )

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES main.cpp colorHistVector.cpp colorHistVector.h util.cpp util.h)
add_executable(Mosaic ${SOURCE_FILES})

target_link_libraries( Mosaic ${OpenCV_LIBS} )