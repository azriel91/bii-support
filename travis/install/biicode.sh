#! /bin/sh
set -ex

SCRIPT_DIR=$(dirname $0)
wget -O "${SCRIPT_DIR}/bii-ubuntu64.deb" http://www.biicode.com/downloads/latest/ubuntu64
sudo dpkg -i "${SCRIPT_DIR}/bii-ubuntu64.deb" && sudo apt-get -f install
bii --version
rm "${SCRIPT_DIR}/bii-ubuntu64.deb"
