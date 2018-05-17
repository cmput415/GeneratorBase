# ANTLRBase
The base cmake setup for a C++ project that generates an ANTLR lexer and parser.

Author: Braedy Kuzma (braedy@ualberta.ca)

# Usage
## Building
### Linux
  1. Install git, java (only the runtime is necessary), and cmake (>= v3.0).
     - Until now, cmake has found the dependencies without issues. If you
       encounter an issue, let Braedy know and we can fix it.
  1. Make a directory that you intend to build the project in and change into
     that directory.
  1. Run `cmake <path-to-ANTLR-Base>`.
  1. Run `make`.
  1. Done.

## For new assignments
  1. Create a new _empty_ repository (do not initialize with anything) on
     GitHub.
  1. Use the "import code from another repository" option.
  1. Input the HTTPS clone url from ANTLRBase. Wait for the import to finish.
  1. Edit grammar related cmake sections. (`GRAMMAR_NAME` and `ANTLR_NAMESPACE`
     in the base directory's `CMakeLists.txt`, rename and edit
     `grammar/placeholder.g4` accordingly).
  1. Distribute.

Follow the pulling in [upstream changes](#pulling-in-upstream-changes) section
below to get new updates.

## Pulling in upstream changes</a>
  1. Add the upstream as a remote using `git remote add upstream <clone-link>`.
  1. Fetch updates from the upstream using `git fetch upstream`
  1. Merge the updates into a local branch using
     `git merge <local branch> upstream/<upstream branch>`. Usually both
     branches are `master`.

Once the remote has been added, future updates are simply the `fetch` and
`merge` steps.
