#! /bin/sh
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo add-apt-repository ppa:h-rayflood/llvm-upper -y # needed for clang 3.6
sudo apt-get update -qq
