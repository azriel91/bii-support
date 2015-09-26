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

# Configure cmake if BUILD_SHARED_LIBS is specified
if [ -n "${BUILD_SHARED_LIBS}" ]; then
  $DRYRUN_REAL bii configure "-DBUILD_SHARED_LIBS=${BUILD_SHARED_LIBS}"
fi

$DRYRUN_REAL bii build
$DRYRUN_REAL bii build --target test
