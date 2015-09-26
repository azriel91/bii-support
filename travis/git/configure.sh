#! /bin/sh
set -e

# Protection if user has not defined environmental variables
IS_MISSING_VARS=false
for USER_DETAIL in USER_EMAIL USER_NAME; do
  eval VALUE=\$$USER_DETAIL
  if [ -z "${VALUE}" ]; then
    >&2 printf "Please set the ${USER_DETAIL} global environmental variable in .travis.yml\n"
    IS_MISSING_VARS=true
  fi
done

if $IS_MISSING_VARS ; then
  exit 1
fi

git config --global user.email "$USER_EMAIL"
git config --global user.name "$USER_NAME"
git config --global push.default simple
