#! /bin/sh
wget https://s3.amazonaws.com/biibinaries/thirdparty/cmake-3.0.2-Linux-64.tar.gz
tar -xzf cmake-3.0.2-Linux-64.tar.gz
sudo cp -fR cmake-3.0.2-Linux-64/* /usr
rm -rf cmake-3.0.2-Linux-64
rm cmake-3.0.2-Linux-64.tar.gz
