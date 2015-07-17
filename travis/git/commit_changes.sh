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

if [ "x${GITHUB_TOKEN}x" = xx ]; then
  >&2 printf "%s\n%s\n%s\n" \
             "Please set the GITHUB_TOKEN secure environmental variable in .travis.yml:" \
             "  - secure:=\"encrypted-personal-access-token\"" \
             "Follow the instructions at: http://blog.biicode.com/automatically-build-publish-via-travis-ci-github/"
  IS_MISSING_VARS=true
fi

if [ $IS_MISSING_VARS = true ] ; then
  exit 1
fi

# If there are changes, commit them
git config credential.helper "store --file=.git/credentials" 
echo "https://${GITHUB_TOKEN}:@github.com" > .git/credentials
git add -A .
git commit -m "$COMMIT_IGNORE_BUILD" 
git remote -v
git remote set-url origin https://github.com/$TRAVIS_REPO_SLUG.git 
git push
