#! /bin/sh
set -e

if [ "$CXX" = "g++" ]; then
  sudo apt-get install -qq g++-4.8;
  export CXX="g++-4.8" CC="gcc-4.8";
  sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 90;
fi
