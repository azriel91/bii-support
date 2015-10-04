#! /bin/sh
set -e

if [ -n "${DRYRUN}" ]; then
  DRYRUN_REAL=echo
fi

SCRIPT_DIR=$(dirname $0)
BLOCK_DIR="${SCRIPT_DIR}/../../.."

if [ -n "${BUILD_SHARED_LIBS}" ] && [ "x${BUILD_SHARED_LIBS}x" != xONx ] && [ "x${BUILD_SHARED_LIBS}x" != xOFFx ]; then
  >&2 printf "The BUILD_SHARED_LIBS variable must be either blank, or set to ON or OFF\n"
  exit 1
fi

# Initialize bii project if it isn't already
if [ ! -f "${BLOCK_DIR}/bii/settings.bii" ]; then
  $DRYRUN_REAL cd $BLOCK_DIR
  $DRYRUN_REAL bii init -l
  $DRYRUN_REAL cd -
fi

# Configure cmake, optionally with BUILD_SHARED_LIBS if specified
if [ -n "${BUILD_SHARED_LIBS}" ]; then
  DEFINE_BUILD_MODE="-DBUILD_SHARED_LIBS=${BUILD_SHARED_LIBS}"
fi
US_ENABLE_AUTOLOADING_SUPPORT=${US_ENABLE_AUTOLOADING_SUPPORT:-ON}

# bii configure -DUS_ENABLE_AUTOLOADING_SUPPORT=ON -DBUILD_SHARED_LIBS=ON
$DRYRUN_REAL bii configure \
  "-DUS_ENABLE_AUTOLOADING_SUPPORT=${US_ENABLE_AUTOLOADING_SUPPORT}" \
  $DEFINE_BUILD_MODE

$DRYRUN_REAL bii build
