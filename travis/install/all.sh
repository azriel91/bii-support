#! /bin/sh
SCRIPT_DIR=$(dirname $0)

sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt-get update -qq

$SCRIPT_DIR/install-cmake.sh
$SCRIPT_DIR/install-clang.sh
$SCRIPT_DIR/install-g++.sh
$SCRIPT_DIR/install-biicode.sh
