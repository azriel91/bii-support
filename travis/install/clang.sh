#! /bin/sh
set -ex

if [ "$CXX" = "clang++" ]; then
  sudo apt-get install -qq clang-3.6;
  export CXX="clang++" CC="clang";
  sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang-3.6 90;
  sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-3.6 90;
  sudo update-alternatives --install /usr/bin/clang cc /usr/bin/clang-3.6 90;
  sudo update-alternatives --install /usr/bin/clang++ c++ /usr/bin/clang++-3.6 90;
fi
