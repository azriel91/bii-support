#! /bin/sh
set -e

# Protection if user has not defined environmental variables
IS_MISSING_VARS=false
if [ "x${COMMIT_IGNORE_BUILD}x" = xx ]; then
  >&2 printf "%s\n%s\n" \
             "Please set the COMMIT_IGNORE_BUILD global environmental variable in .travis.yml:" \
             "  - COMMIT_IGNORE_BUILD=\"Promoted version. ***travis***\""
  IS_MISSING_VARS=true
fi
if [ $IS_MISSING_VARS = true ] ; then exit 1 ; fi

export TRAVIS_COMMIT_MSG="$(git log --format=%B --no-merges -n 1)"
if [ "${TRAVIS_COMMIT_MSG}" = "${COMMIT_IGNORE_BUILD}" ]; then
  printf "true\n"
else
  printf "false\n"
fi

exit 0
