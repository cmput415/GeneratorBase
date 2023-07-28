# GeneratorBase
The base cmake setup for generator assignment.

Author: Braedy Kuzma (braedy@ualberta.ca)  
Updated by: Deric Cheung (dacheung@ualberta.ca)

# Usage
## Building
### Linux
  1. Follow the setup instructions so that git, java, clang, cmake (>= v3.0)
     and ANTLR are installed.
  2. Make sure that ANTLR_INS and ANTLR_JAR are set in your environment
  3. Make a directory that you intend to build the project in and change into
     that directory.
  4. Run `cmake <path-to-GeneratorBase>`.
  5. Run `make`.
  6. Done.

## Pulling in upstream changes
If there are updates to your assignment you can retrieve them using the
instructions here.
  1. Add the upstream as a remote using `git remote add upstream <clone-link>`.
  2. Fetch updates from the upstream using `git fetch upstream`
  3. Merge the updates into a local branch using
     `git merge <local branch> upstream/<upstream branch>`. Usually both
     branches are `master`.
  4. Make sure that everything builds before committing to your personal
     master! It's much easier to try again if you can make a fresh clone
     without the merge!

Once the remote has been added, future updates are simply the `fetch` and
`merge` steps.
