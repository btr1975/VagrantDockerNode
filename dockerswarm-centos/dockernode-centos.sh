#!/bin/bash

# Description: A Docker Node for vagrant on CentOS 7
# Author: Benjamin P. Trachtenberg
# Version: 1.0.1
#

# Remove old Docker if installed
yum remove docker \
    docker-common \
    docker-selinux \
    docker-engine

# Install all os updates
yum update -y

# Install other requirements
yum install -y yum-utils \
    device-mapper-persistent-data \
    lvm2 \
    epel-release

# Install Docker GPG Key
rpm --import https://download.docker.com/linux/centos/gpg
# Verify Docker GPG Key
rpm -qi gpg-pubkey-621e9f35-58adea78

# Use the stable repo
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker CE, and pip for python2
yum install -y docker-ce \
    python-pip

# Start Docker
systemctl start docker

# Set Docker daemon to run at boot
systemctl enable docker

# pip stuff
pip install --upgrade pip
pip install --upgrade docker-compose
usermod -aG docker vagrant

# Fix Ddocker info warnings
sysctl net.bridge.bridge-nf-call-iptables=1
sysctl net.bridge.bridge-nf-call-ip6tables=1

