#! /bin/sh
set -e

SCRIPT_DIR=$(dirname $0)

export BUILD_SHARED_LIBS=OFF

$SCRIPT_DIR/internal/build.sh