#! /bin/sh
set -e

. $(dirname $0)/internal/commit_messages.sh

# Protection if user has not defined environmental variables
IS_MISSING_VARS=false

if [ -z $(git config user.name) ] || [ -z $(git config user.email) ] ; then
  >&2 printf "%s\n%s\n" \
             "Please ensure that the git user.name and user.email are configured. "
             "You may use the \"configure.sh\" script next to this script in the bii-support repository."
  IS_MISSING_VARS=true
fi

if [ -z $GITHUB_TOKEN ]; then
  >&2 printf "%s\n%s\n%s\n" \
             "Please set the GITHUB_TOKEN secure environmental variable in .travis.yml:" \
             "  - secure: \"encrypted-personal-access-token\"" \
             "Follow the instructions at: http://blog.biicode.com/automatically-build-publish-via-travis-ci-github/"
  IS_MISSING_VARS=true
fi

if $IS_MISSING_VARS ; then exit 1 fi

# If there are changes, commit them
git config credential.helper "store --file=.git/credentials" 
echo "https://${GITHUB_TOKEN}:@github.com" > .git/credentials
git add -A .
git commit -m "$COMMIT_IGNORE_BUILD" 
git remote -v
git remote set-url origin https://github.com/$TRAVIS_REPO_SLUG.git 
git push
