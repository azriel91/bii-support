#! /bin/sh
wget -O bii-ubuntu64.deb http://www.biicode.com/downloads/latest/ubuntu64
"(sudo dpkg -i bii-ubuntu64.deb) && sudo apt-get -f install"
bii --version
rm bii-ubuntu64.deb
