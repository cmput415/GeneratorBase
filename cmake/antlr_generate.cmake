# Fail if we don't have the ANTLR jar.
if(NOT EXISTS "${ANTLR_JAR}")
  message(FATAL_ERROR "Unable to find antlr jar. Did we miss a build step?")
endif()

# TODO: Change this into a list
# Get the path to the grammar.
file(TO_CMAKE_PATH "${CMAKE_SOURCE_DIR}/grammar/${GRAMMAR_NAME}.g4" GRAMMAR_PATH)
set(GRAMMAR_PATH "${GRAMMAR_PATH}" CACHE FILEPATH "Path to the grammar file.")

# Set the directory for generated sources (this might be better off in CMAKE_BINARY_DIR).
file(TO_CMAKE_PATH "${CMAKE_SOURCE_DIR}/gen/${ANTLR_NAMESPACE}" GEN_DIR)
set(GEN_DIR ${GEN_DIR} CACHE PATH "Generated source directory (ANTLR).")
file(TO_NATIVE_PATH "${GEN_DIR}" GEN_DIR_NATIVE)
message(STATUS "Generated source destination: ${GEN_DIR_NATIVE}")

# Change the command (target) name and actual command based on whether or not we have a namespace
# to use.
if(DEFINED ANTLR_NAMESPACE)
  set(
    ANTLR_COMMAND
      "${Java_JAVA_EXECUTABLE}" -jar "${ANTLR_JAR}" -Werror -Dlanguage=Cpp -listener -visitor
      -o "${GEN_DIR}" -package "${ANTLR_NAMESPACE}" "${GRAMMAR_PATH}"
  )
else()
  set(
    ANTLR_COMMAND
      "${Java_JAVA_EXECUTABLE}" -jar "${ANTLR_JAR}" -Werror -Dlanguage=Cpp -listener -visitor
      -o "${GEN_DIR}" "${GRAMMAR_PATH}"
  )
endif()

# The list of our generated source files, necessary to specify what the output of the ANTLR
# generation command is so that the build system can propagate changes to the grammar appropriately.
set(
  ANTLR_GEN_SRC
    "${GEN_DIR}/${GRAMMAR_NAME}BaseListener.cpp"
    "${GEN_DIR}/${GRAMMAR_NAME}BaseVisitor.cpp"
    "${GEN_DIR}/${GRAMMAR_NAME}Lexer.cpp"
    "${GEN_DIR}/${GRAMMAR_NAME}Listener.cpp"
    "${GEN_DIR}/${GRAMMAR_NAME}Parser.cpp"
    "${GEN_DIR}/${GRAMMAR_NAME}Visitor.cpp"
)

set(
  ANTLR_GEN_HEADERS
    "${GEN_DIR}/${GRAMMAR_NAME}BaseListener.h"
    "${GEN_DIR}/${GRAMMAR_NAME}BaseVisitor.h"
    "${GEN_DIR}/${GRAMMAR_NAME}Lexer.h"
    "${GEN_DIR}/${GRAMMAR_NAME}Listener.h"
    "${GEN_DIR}/${GRAMMAR_NAME}Parser.h"
    "${GEN_DIR}/${GRAMMAR_NAME}Visitor.h"
)

# Create the command to generate the sources.
add_custom_command(
  OUTPUT ${ANTLR_GEN_SRC} ${ANTLR_GEN_HEADERS}
  DEPENDS antlr "${GRAMMAR_PATH}"
  COMMAND
    ${CMAKE_COMMAND} -E make_directory ${GEN_DIR}
  COMMAND
    ${ANTLR_COMMAND}
  WORKING_DIRECTORY "${CMAKE_BINARY_DIR}"
)

# Build the library
# The headers aren't required in add_library to build, but CLion complains about them not being
# "used", saying they won't be available in IDE static analysis, if they aren't included here.
add_library(parser STATIC ${ANTLR_GEN_SRC} ${ANTLR_GEN_HEADERS})
target_include_directories(parser PUBLIC ${ANTLR_INCLUDE_DIRS})
