#! /bin/sh
set -ex

if [ "$CXX" = "clang++" ]; then
  sudo apt-get install -qq clang;
  export CXX="clang++" CC="clang";
  sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang 90;
  sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 90;
fi
