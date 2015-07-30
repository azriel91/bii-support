#! /bin/bash
set -e

. $(dirname $0)/internal/commit_messages.sh

export TRAVIS_COMMIT_MSG="$(git log --format=%B --no-merges -n 1)"
if [ "${TRAVIS_COMMIT_MSG}" = "${COMMIT_IGNORE_BUILD}" ]; then
  printf "true\n"
else
  printf "false\n"
fi

exit 0
