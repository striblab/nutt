#!/bin/bash

###
# This script is mostly a documentation of what is installed
# and may not worked completely as a script.
###

# Packages
sudo apt install git-core pip-python moreutils

# Node js
# https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install nodejs

# Global node packages
sudo npm install -g gulp yo n forever


# Python
sudo pip install --upgrade pip
sudo pip install datadog


# Setup place for projects and logs
sudo mkdir /nutt
sudo chown $USER:users /nutt
mkdir -p /nutt/projects
mkdir -p /nutt/logs


# This project
git clone https://github.com/striblab/nutt.git /nutt/projects/nutt
