# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/robot/dd2419_ws/src/course_packages/crazyflie_ros/crazyflie_tools

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/robot/dd2419_ws/build/crazyflie_tools

# Include any dependencies generated for this target.
include CMakeFiles/battery.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/battery.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/battery.dir/flags.make

CMakeFiles/battery.dir/src/battery.cpp.o: CMakeFiles/battery.dir/flags.make
CMakeFiles/battery.dir/src/battery.cpp.o: /home/robot/dd2419_ws/src/course_packages/crazyflie_ros/crazyflie_tools/src/battery.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/robot/dd2419_ws/build/crazyflie_tools/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/battery.dir/src/battery.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/battery.dir/src/battery.cpp.o -c /home/robot/dd2419_ws/src/course_packages/crazyflie_ros/crazyflie_tools/src/battery.cpp

CMakeFiles/battery.dir/src/battery.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/battery.dir/src/battery.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/robot/dd2419_ws/src/course_packages/crazyflie_ros/crazyflie_tools/src/battery.cpp > CMakeFiles/battery.dir/src/battery.cpp.i

CMakeFiles/battery.dir/src/battery.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/battery.dir/src/battery.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/robot/dd2419_ws/src/course_packages/crazyflie_ros/crazyflie_tools/src/battery.cpp -o CMakeFiles/battery.dir/src/battery.cpp.s

CMakeFiles/battery.dir/src/battery.cpp.o.requires:

.PHONY : CMakeFiles/battery.dir/src/battery.cpp.o.requires

CMakeFiles/battery.dir/src/battery.cpp.o.provides: CMakeFiles/battery.dir/src/battery.cpp.o.requires
	$(MAKE) -f CMakeFiles/battery.dir/build.make CMakeFiles/battery.dir/src/battery.cpp.o.provides.build
.PHONY : CMakeFiles/battery.dir/src/battery.cpp.o.provides

CMakeFiles/battery.dir/src/battery.cpp.o.provides.build: CMakeFiles/battery.dir/src/battery.cpp.o


# Object files for target battery
battery_OBJECTS = \
"CMakeFiles/battery.dir/src/battery.cpp.o"

# External object files for target battery
battery_EXTERNAL_OBJECTS =

/home/robot/dd2419_ws/devel/.private/crazyflie_tools/lib/crazyflie_tools/battery: CMakeFiles/battery.dir/src/battery.cpp.o
/home/robot/dd2419_ws/devel/.private/crazyflie_tools/lib/crazyflie_tools/battery: CMakeFiles/battery.dir/build.make
/home/robot/dd2419_ws/devel/.private/crazyflie_tools/lib/crazyflie_tools/battery: /home/robot/dd2419_ws/devel/.private/crazyflie_cpp/lib/libcrazyflie_cpp.so
/home/robot/dd2419_ws/devel/.private/crazyflie_tools/lib/crazyflie_tools/battery: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
/home/robot/dd2419_ws/devel/.private/crazyflie_tools/lib/crazyflie_tools/battery: CMakeFiles/battery.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/robot/dd2419_ws/build/crazyflie_tools/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/robot/dd2419_ws/devel/.private/crazyflie_tools/lib/crazyflie_tools/battery"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/battery.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/battery.dir/build: /home/robot/dd2419_ws/devel/.private/crazyflie_tools/lib/crazyflie_tools/battery

.PHONY : CMakeFiles/battery.dir/build

CMakeFiles/battery.dir/requires: CMakeFiles/battery.dir/src/battery.cpp.o.requires

.PHONY : CMakeFiles/battery.dir/requires

CMakeFiles/battery.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/battery.dir/cmake_clean.cmake
.PHONY : CMakeFiles/battery.dir/clean

CMakeFiles/battery.dir/depend:
	cd /home/robot/dd2419_ws/build/crazyflie_tools && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/robot/dd2419_ws/src/course_packages/crazyflie_ros/crazyflie_tools /home/robot/dd2419_ws/src/course_packages/crazyflie_ros/crazyflie_tools /home/robot/dd2419_ws/build/crazyflie_tools /home/robot/dd2419_ws/build/crazyflie_tools /home/robot/dd2419_ws/build/crazyflie_tools/CMakeFiles/battery.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/battery.dir/depend

