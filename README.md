# ANTLRBase
The base cmake setup for a C++ project that generates an ANTLR lexer and parser.

Author: Braedy Kuzma (braedy@ualberta.ca)

# Usage (Building)
### Linux
  1. Install git, java (only the runtime is necessary), and cmake (>= v3.0).
     - Until now, cmake has found the dependencies without issues. If you
       encounter an issue, let me know and we can fix it.
  1. Make a directory that you intend to build the project in and change into
     that directory.
  1. Run `cmake <path-to-ANTLR-Base>`.
  1. Run `make`.
  1. Done.

# Usage (For new assignments)
  1. Edit grammar related cmake sections. (GRAMMAR_NAME and ANTLR_NAMESPACE in
     the base directory's CMakeLists.txt, rename and edit grammar/placeholder.g4
     accordingly).
  1. Distribute.
