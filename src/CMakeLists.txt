# Gather our source files in this directory
set(
  placeholder_src_files
    "${CMAKE_CURRENT_SOURCE_DIR}/placeholder.cpp"
)

# Build our executable from the source files
add_executable(placeholder ${placeholder_src_files})
target_include_directories(placeholder PUBLIC ${ANTLR_GEN_DIR})

# Add the antlr runtime and parser as libraries to link
target_link_libraries(placeholder parser antlr4-runtime)

# Symbolic link our executable to the base directory so we don't have to go searching for it
symlink_to_bin("placeholder")
