# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_COMMAND = /root/inery/2.0/bin/cmake

# The command to remove a file.
RM = /root/inery/2.0/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/inery-contracts/inery.contracts/contracts

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/inery-contracts/inery.contracts/build/contracts

# Include any dependencies generated for this target.
include inery.msig/CMakeFiles/inery.msig.dir/depend.make

# Include the progress variables for this target.
include inery.msig/CMakeFiles/inery.msig.dir/progress.make

# Include the compile flags for this target's objects.
include inery.msig/CMakeFiles/inery.msig.dir/flags.make

inery.msig/CMakeFiles/inery.msig.dir/src/inery.msig.cpp.obj: inery.msig/CMakeFiles/inery.msig.dir/flags.make
inery.msig/CMakeFiles/inery.msig.dir/src/inery.msig.cpp.obj: /home/inery-contracts/inery.contracts/contracts/inery.msig/src/inery.msig.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/inery-contracts/inery.contracts/build/contracts/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object inery.msig/CMakeFiles/inery.msig.dir/src/inery.msig.cpp.obj"
	cd /home/inery-contracts/inery.contracts/build/contracts/inery.msig && /usr/local/inery.cdt/bin/inery-cpp  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/inery.msig.dir/src/inery.msig.cpp.obj -c /home/inery-contracts/inery.contracts/contracts/inery.msig/src/inery.msig.cpp

inery.msig/CMakeFiles/inery.msig.dir/src/inery.msig.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/inery.msig.dir/src/inery.msig.cpp.i"
	cd /home/inery-contracts/inery.contracts/build/contracts/inery.msig && /usr/local/inery.cdt/bin/inery-cpp $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/inery-contracts/inery.contracts/contracts/inery.msig/src/inery.msig.cpp > CMakeFiles/inery.msig.dir/src/inery.msig.cpp.i

inery.msig/CMakeFiles/inery.msig.dir/src/inery.msig.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/inery.msig.dir/src/inery.msig.cpp.s"
	cd /home/inery-contracts/inery.contracts/build/contracts/inery.msig && /usr/local/inery.cdt/bin/inery-cpp $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/inery-contracts/inery.contracts/contracts/inery.msig/src/inery.msig.cpp -o CMakeFiles/inery.msig.dir/src/inery.msig.cpp.s

# Object files for target inery.msig
inery_msig_OBJECTS = \
"CMakeFiles/inery.msig.dir/src/inery.msig.cpp.obj"

# External object files for target inery.msig
inery_msig_EXTERNAL_OBJECTS =

inery.msig/inery.msig.wasm: inery.msig/CMakeFiles/inery.msig.dir/src/inery.msig.cpp.obj
inery.msig/inery.msig.wasm: inery.msig/CMakeFiles/inery.msig.dir/build.make
inery.msig/inery.msig.wasm: inery.msig/CMakeFiles/inery.msig.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/inery-contracts/inery.contracts/build/contracts/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable inery.msig.wasm"
	cd /home/inery-contracts/inery.contracts/build/contracts/inery.msig && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/inery.msig.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
inery.msig/CMakeFiles/inery.msig.dir/build: inery.msig/inery.msig.wasm

.PHONY : inery.msig/CMakeFiles/inery.msig.dir/build

inery.msig/CMakeFiles/inery.msig.dir/clean:
	cd /home/inery-contracts/inery.contracts/build/contracts/inery.msig && $(CMAKE_COMMAND) -P CMakeFiles/inery.msig.dir/cmake_clean.cmake
.PHONY : inery.msig/CMakeFiles/inery.msig.dir/clean

inery.msig/CMakeFiles/inery.msig.dir/depend:
	cd /home/inery-contracts/inery.contracts/build/contracts && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/inery-contracts/inery.contracts/contracts /home/inery-contracts/inery.contracts/contracts/inery.msig /home/inery-contracts/inery.contracts/build/contracts /home/inery-contracts/inery.contracts/build/contracts/inery.msig /home/inery-contracts/inery.contracts/build/contracts/inery.msig/CMakeFiles/inery.msig.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : inery.msig/CMakeFiles/inery.msig.dir/depend

