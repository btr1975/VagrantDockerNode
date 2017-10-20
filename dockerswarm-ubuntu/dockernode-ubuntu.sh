#!/bin/bash

# Description: A Docker Node for vagrant Ubuntu 16.04 LTS
# Author: Benjamin P. Trachtenberg
# Version: 1.0.1
#

apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install -y \
    docker-ce \
    docker-compose \
    python-pip
apt-get upgrade -y
apt-get clean
pip install --upgrade pip
pip install --upgrade docker-compose
pip uninstall -y docker-py
pip uninstall -y docker
pip install docker
usermod -aG docker ubuntu

