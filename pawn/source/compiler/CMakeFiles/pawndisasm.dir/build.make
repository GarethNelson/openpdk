# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.6

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
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

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gareth/open_pdk/pawn/source/compiler

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gareth/open_pdk/pawn/source/compiler

# Include any dependencies generated for this target.
include CMakeFiles/pawndisasm.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/pawndisasm.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/pawndisasm.dir/flags.make

CMakeFiles/pawndisasm.dir/pawndisasm.o: CMakeFiles/pawndisasm.dir/flags.make
CMakeFiles/pawndisasm.dir/pawndisasm.o: pawndisasm.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/gareth/open_pdk/pawn/source/compiler/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/pawndisasm.dir/pawndisasm.o"
	/usr/lib/ccache/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/pawndisasm.dir/pawndisasm.o   -c /home/gareth/open_pdk/pawn/source/compiler/pawndisasm.c

CMakeFiles/pawndisasm.dir/pawndisasm.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/pawndisasm.dir/pawndisasm.i"
	/usr/lib/ccache/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/gareth/open_pdk/pawn/source/compiler/pawndisasm.c > CMakeFiles/pawndisasm.dir/pawndisasm.i

CMakeFiles/pawndisasm.dir/pawndisasm.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/pawndisasm.dir/pawndisasm.s"
	/usr/lib/ccache/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/gareth/open_pdk/pawn/source/compiler/pawndisasm.c -o CMakeFiles/pawndisasm.dir/pawndisasm.s

CMakeFiles/pawndisasm.dir/pawndisasm.o.requires:
.PHONY : CMakeFiles/pawndisasm.dir/pawndisasm.o.requires

CMakeFiles/pawndisasm.dir/pawndisasm.o.provides: CMakeFiles/pawndisasm.dir/pawndisasm.o.requires
	$(MAKE) -f CMakeFiles/pawndisasm.dir/build.make CMakeFiles/pawndisasm.dir/pawndisasm.o.provides.build
.PHONY : CMakeFiles/pawndisasm.dir/pawndisasm.o.provides

CMakeFiles/pawndisasm.dir/pawndisasm.o.provides.build: CMakeFiles/pawndisasm.dir/pawndisasm.o
.PHONY : CMakeFiles/pawndisasm.dir/pawndisasm.o.provides.build

# Object files for target pawndisasm
pawndisasm_OBJECTS = \
"CMakeFiles/pawndisasm.dir/pawndisasm.o"

# External object files for target pawndisasm
pawndisasm_EXTERNAL_OBJECTS =

pawndisasm: CMakeFiles/pawndisasm.dir/pawndisasm.o
pawndisasm: CMakeFiles/pawndisasm.dir/build.make
pawndisasm: CMakeFiles/pawndisasm.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable pawndisasm"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pawndisasm.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/pawndisasm.dir/build: pawndisasm
.PHONY : CMakeFiles/pawndisasm.dir/build

CMakeFiles/pawndisasm.dir/requires: CMakeFiles/pawndisasm.dir/pawndisasm.o.requires
.PHONY : CMakeFiles/pawndisasm.dir/requires

CMakeFiles/pawndisasm.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/pawndisasm.dir/cmake_clean.cmake
.PHONY : CMakeFiles/pawndisasm.dir/clean

CMakeFiles/pawndisasm.dir/depend:
	cd /home/gareth/open_pdk/pawn/source/compiler && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gareth/open_pdk/pawn/source/compiler /home/gareth/open_pdk/pawn/source/compiler /home/gareth/open_pdk/pawn/source/compiler /home/gareth/open_pdk/pawn/source/compiler /home/gareth/open_pdk/pawn/source/compiler/CMakeFiles/pawndisasm.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/pawndisasm.dir/depend

