#! /bin/sh
set -ex

SCRIPT_DIR=$(dirname $0)

$SCRIPT_DIR/apt_update.sh

$SCRIPT_DIR/cmake.sh
$SCRIPT_DIR/clang.sh
$SCRIPT_DIR/g++.sh
$SCRIPT_DIR/biicode.sh
$SCRIPT_DIR/valgrind.sh
