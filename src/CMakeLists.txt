set(
  placeholder_src_files
    "${CMAKE_CURRENT_SOURCE_DIR}/placeholder.cpp"
)

add_executable(placeholder ${placeholder_src_files})

# Add the parser as a link
target_link_libraries(placeholder parser)
