#!/bin/bash
set -e -x
export DEBIAN_FRONTEND=noninteractive
sudo ln -sf /usr/share/zoneinfo/UTC /etc/localtime

# Update and install main packages
sudo apt-get update
sudo apt-get -y install build-essential libssl-dev checkinstall git-core curl vim python-software-properties nodejs npm
sudo add-apt-repository -y ppa:fkrull/deadsnakes
sudo apt-get update
sudo apt-get -y install python3.3
wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py -O - | sudo python3.3
sudo easy_install pip
# Deal with node.js open file limitations
ulimit -n 10000

source /home/vagrant/.profile
