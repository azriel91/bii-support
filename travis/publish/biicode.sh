#! /bin/sh
set -e

# Protection if user has not defined environmental variables
IS_MISSING_VARS=false

if [ -z $BII_PASSWORD ]; then
  >&2 printf "%s\n%s\n%s\n" \
             "Please set the BII_PASSWORD secure environmental variable in .travis.yml:" \
             "  - secure:=\"encrypted-personal-access-token\"" \
             "Follow the instructions at: http://blog.biicode.com/automatically-build-publish-via-travis-ci-github/"
  IS_MISSING_VARS=true
fi

if $IS_MISSING_VARS ; then
  exit 1
fi

# === Publish block === #

# If there are untracked changes to the block, then publishing with vcs info (-r) will fail
# Here we output the state of the repository, so users can see what the state is if it fails
git status -u

bii user $USER -p $BII_PASSWORD
if [ -n $TRAVIS_TAG ]; then bii publish -r --tag STABLE --versiontag $TRAVIS_TAG; fi
if [ -z $TRAVIS_TAG ]; then bii publish -r; fi


# === Commit Repository Changes === #

# A biicode publish may update biicode.conf
# Given the user is using travis to publish the block, travis should also hold the responsibility of committing the
# changes that are caused by biicode's publish
$(dirname $0)/../git/commit_changes.sh
