# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.6

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Mosaic.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Mosaic.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Mosaic.dir/flags.make

CMakeFiles/Mosaic.dir/main.cpp.o: CMakeFiles/Mosaic.dir/flags.make
CMakeFiles/Mosaic.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Mosaic.dir/main.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mosaic.dir/main.cpp.o -c /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/main.cpp

CMakeFiles/Mosaic.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mosaic.dir/main.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/main.cpp > CMakeFiles/Mosaic.dir/main.cpp.i

CMakeFiles/Mosaic.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mosaic.dir/main.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/main.cpp -o CMakeFiles/Mosaic.dir/main.cpp.s

CMakeFiles/Mosaic.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/Mosaic.dir/main.cpp.o.requires

CMakeFiles/Mosaic.dir/main.cpp.o.provides: CMakeFiles/Mosaic.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/Mosaic.dir/build.make CMakeFiles/Mosaic.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/Mosaic.dir/main.cpp.o.provides

CMakeFiles/Mosaic.dir/main.cpp.o.provides.build: CMakeFiles/Mosaic.dir/main.cpp.o


CMakeFiles/Mosaic.dir/colorHistVector.cpp.o: CMakeFiles/Mosaic.dir/flags.make
CMakeFiles/Mosaic.dir/colorHistVector.cpp.o: ../colorHistVector.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/Mosaic.dir/colorHistVector.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mosaic.dir/colorHistVector.cpp.o -c /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/colorHistVector.cpp

CMakeFiles/Mosaic.dir/colorHistVector.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mosaic.dir/colorHistVector.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/colorHistVector.cpp > CMakeFiles/Mosaic.dir/colorHistVector.cpp.i

CMakeFiles/Mosaic.dir/colorHistVector.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mosaic.dir/colorHistVector.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/colorHistVector.cpp -o CMakeFiles/Mosaic.dir/colorHistVector.cpp.s

CMakeFiles/Mosaic.dir/colorHistVector.cpp.o.requires:

.PHONY : CMakeFiles/Mosaic.dir/colorHistVector.cpp.o.requires

CMakeFiles/Mosaic.dir/colorHistVector.cpp.o.provides: CMakeFiles/Mosaic.dir/colorHistVector.cpp.o.requires
	$(MAKE) -f CMakeFiles/Mosaic.dir/build.make CMakeFiles/Mosaic.dir/colorHistVector.cpp.o.provides.build
.PHONY : CMakeFiles/Mosaic.dir/colorHistVector.cpp.o.provides

CMakeFiles/Mosaic.dir/colorHistVector.cpp.o.provides.build: CMakeFiles/Mosaic.dir/colorHistVector.cpp.o


CMakeFiles/Mosaic.dir/util.cpp.o: CMakeFiles/Mosaic.dir/flags.make
CMakeFiles/Mosaic.dir/util.cpp.o: ../util.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/Mosaic.dir/util.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mosaic.dir/util.cpp.o -c /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/util.cpp

CMakeFiles/Mosaic.dir/util.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mosaic.dir/util.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/util.cpp > CMakeFiles/Mosaic.dir/util.cpp.i

CMakeFiles/Mosaic.dir/util.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mosaic.dir/util.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/util.cpp -o CMakeFiles/Mosaic.dir/util.cpp.s

CMakeFiles/Mosaic.dir/util.cpp.o.requires:

.PHONY : CMakeFiles/Mosaic.dir/util.cpp.o.requires

CMakeFiles/Mosaic.dir/util.cpp.o.provides: CMakeFiles/Mosaic.dir/util.cpp.o.requires
	$(MAKE) -f CMakeFiles/Mosaic.dir/build.make CMakeFiles/Mosaic.dir/util.cpp.o.provides.build
.PHONY : CMakeFiles/Mosaic.dir/util.cpp.o.provides

CMakeFiles/Mosaic.dir/util.cpp.o.provides.build: CMakeFiles/Mosaic.dir/util.cpp.o


CMakeFiles/Mosaic.dir/quadTree.cpp.o: CMakeFiles/Mosaic.dir/flags.make
CMakeFiles/Mosaic.dir/quadTree.cpp.o: ../quadTree.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/Mosaic.dir/quadTree.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mosaic.dir/quadTree.cpp.o -c /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/quadTree.cpp

CMakeFiles/Mosaic.dir/quadTree.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mosaic.dir/quadTree.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/quadTree.cpp > CMakeFiles/Mosaic.dir/quadTree.cpp.i

CMakeFiles/Mosaic.dir/quadTree.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mosaic.dir/quadTree.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/quadTree.cpp -o CMakeFiles/Mosaic.dir/quadTree.cpp.s

CMakeFiles/Mosaic.dir/quadTree.cpp.o.requires:

.PHONY : CMakeFiles/Mosaic.dir/quadTree.cpp.o.requires

CMakeFiles/Mosaic.dir/quadTree.cpp.o.provides: CMakeFiles/Mosaic.dir/quadTree.cpp.o.requires
	$(MAKE) -f CMakeFiles/Mosaic.dir/build.make CMakeFiles/Mosaic.dir/quadTree.cpp.o.provides.build
.PHONY : CMakeFiles/Mosaic.dir/quadTree.cpp.o.provides

CMakeFiles/Mosaic.dir/quadTree.cpp.o.provides.build: CMakeFiles/Mosaic.dir/quadTree.cpp.o


CMakeFiles/Mosaic.dir/imgSegmentation.cpp.o: CMakeFiles/Mosaic.dir/flags.make
CMakeFiles/Mosaic.dir/imgSegmentation.cpp.o: ../imgSegmentation.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/Mosaic.dir/imgSegmentation.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mosaic.dir/imgSegmentation.cpp.o -c /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/imgSegmentation.cpp

CMakeFiles/Mosaic.dir/imgSegmentation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mosaic.dir/imgSegmentation.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/imgSegmentation.cpp > CMakeFiles/Mosaic.dir/imgSegmentation.cpp.i

CMakeFiles/Mosaic.dir/imgSegmentation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mosaic.dir/imgSegmentation.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/imgSegmentation.cpp -o CMakeFiles/Mosaic.dir/imgSegmentation.cpp.s

CMakeFiles/Mosaic.dir/imgSegmentation.cpp.o.requires:

.PHONY : CMakeFiles/Mosaic.dir/imgSegmentation.cpp.o.requires

CMakeFiles/Mosaic.dir/imgSegmentation.cpp.o.provides: CMakeFiles/Mosaic.dir/imgSegmentation.cpp.o.requires
	$(MAKE) -f CMakeFiles/Mosaic.dir/build.make CMakeFiles/Mosaic.dir/imgSegmentation.cpp.o.provides.build
.PHONY : CMakeFiles/Mosaic.dir/imgSegmentation.cpp.o.provides

CMakeFiles/Mosaic.dir/imgSegmentation.cpp.o.provides.build: CMakeFiles/Mosaic.dir/imgSegmentation.cpp.o


# Object files for target Mosaic
Mosaic_OBJECTS = \
"CMakeFiles/Mosaic.dir/main.cpp.o" \
"CMakeFiles/Mosaic.dir/colorHistVector.cpp.o" \
"CMakeFiles/Mosaic.dir/util.cpp.o" \
"CMakeFiles/Mosaic.dir/quadTree.cpp.o" \
"CMakeFiles/Mosaic.dir/imgSegmentation.cpp.o"

# External object files for target Mosaic
Mosaic_EXTERNAL_OBJECTS =

Mosaic: CMakeFiles/Mosaic.dir/main.cpp.o
Mosaic: CMakeFiles/Mosaic.dir/colorHistVector.cpp.o
Mosaic: CMakeFiles/Mosaic.dir/util.cpp.o
Mosaic: CMakeFiles/Mosaic.dir/quadTree.cpp.o
Mosaic: CMakeFiles/Mosaic.dir/imgSegmentation.cpp.o
Mosaic: CMakeFiles/Mosaic.dir/build.make
Mosaic: /usr/local/lib/libopencv_shape.3.2.0.dylib
Mosaic: /usr/local/lib/libopencv_stitching.3.2.0.dylib
Mosaic: /usr/local/lib/libopencv_superres.3.2.0.dylib
Mosaic: /usr/local/lib/libopencv_videostab.3.2.0.dylib
Mosaic: /usr/local/lib/libopencv_objdetect.3.2.0.dylib
Mosaic: /usr/local/lib/libopencv_calib3d.3.2.0.dylib
Mosaic: /usr/local/lib/libopencv_features2d.3.2.0.dylib
Mosaic: /usr/local/lib/libopencv_flann.3.2.0.dylib
Mosaic: /usr/local/lib/libopencv_highgui.3.2.0.dylib
Mosaic: /usr/local/lib/libopencv_ml.3.2.0.dylib
Mosaic: /usr/local/lib/libopencv_photo.3.2.0.dylib
Mosaic: /usr/local/lib/libopencv_video.3.2.0.dylib
Mosaic: /usr/local/lib/libopencv_videoio.3.2.0.dylib
Mosaic: /usr/local/lib/libopencv_imgcodecs.3.2.0.dylib
Mosaic: /usr/local/lib/libopencv_imgproc.3.2.0.dylib
Mosaic: /usr/local/lib/libopencv_core.3.2.0.dylib
Mosaic: CMakeFiles/Mosaic.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX executable Mosaic"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Mosaic.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Mosaic.dir/build: Mosaic

.PHONY : CMakeFiles/Mosaic.dir/build

CMakeFiles/Mosaic.dir/requires: CMakeFiles/Mosaic.dir/main.cpp.o.requires
CMakeFiles/Mosaic.dir/requires: CMakeFiles/Mosaic.dir/colorHistVector.cpp.o.requires
CMakeFiles/Mosaic.dir/requires: CMakeFiles/Mosaic.dir/util.cpp.o.requires
CMakeFiles/Mosaic.dir/requires: CMakeFiles/Mosaic.dir/quadTree.cpp.o.requires
CMakeFiles/Mosaic.dir/requires: CMakeFiles/Mosaic.dir/imgSegmentation.cpp.o.requires

.PHONY : CMakeFiles/Mosaic.dir/requires

CMakeFiles/Mosaic.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Mosaic.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Mosaic.dir/clean

CMakeFiles/Mosaic.dir/depend:
	cd /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/cmake-build-debug /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/cmake-build-debug /Users/zhiyuanwang/Documents/Workspace/CVML/Mosaic/cmake-build-debug/CMakeFiles/Mosaic.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Mosaic.dir/depend

