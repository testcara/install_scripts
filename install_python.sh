#!/usr/bin/env bash
# install the make tools
sudo yum install gcc openssl-devel bzip2-devel -y
# download the src code from python formal webs
cd /usr/src
sudo wget http://www.python.org/ftp/python/3.6.5/Python-3.6.5.tar.xz
# uncompress, configure and build it
sudo tar -xvf Python-3.6.5.tar.xz
cd Python-3.6.5
sudo ./configure --enable-optimizations
sudo make altinstall
# check the python version
/usr/local/bin/python3.6 -V

# install pip
sudo wget http://bootstrap.pypa.io/get-pip.py
sudo /usr/local/bin/python3.6 get-pip.py
