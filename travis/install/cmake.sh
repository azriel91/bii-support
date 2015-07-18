#! /bin/sh
set -e

SCRIPT_DIR=$(dirname $0)
wget -O "${SCRIPT_DIR}/cmake-3.0.2-Linux-64.tar.gz" https://s3.amazonaws.com/biibinaries/thirdparty/cmake-3.0.2-Linux-64.tar.gz
tar -xzf "${SCRIPT_DIR}/cmake-3.0.2-Linux-64.tar.gz" -C $SCRIPT_DIR
sudo cp -fR "${SCRIPT_DIR}/cmake-3.0.2-Linux-64/*" /usr
rm -rf "${SCRIPT_DIR}/cmake-3.0.2-Linux-64"
rm "${SCRIPT_DIR}/cmake-3.0.2-Linux-64.tar.gz"
