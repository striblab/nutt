#!/bin/bash

###
# This script is mostly a documentation of what is installed
# and may not worked completely as a script.
###

# Initially time was off, but should be ok
# https://github.com/MinneapolisStarTribune/ansible-infrastructure/issues/1878
#sudo apt-get install ntp ntpstat
#sudo service ntp restart


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
sudo pip install datadog awscli


# Setup place for projects and logs
sudo mkdir /nutt
sudo chown $USER:users /nutt
mkdir -p /nutt/projects
mkdir -p /nutt/logs
mkdir -p /nutt/data


# This project
git clone https://github.com/striblab/nutt.git /nutt/projects/nutt
cd /nutt/projects/nutt

# Configure AWS cli
# http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html
aws configure

# Setup logrotate
sudo cp /etc/logrotate.conf /etc/logrotate.conf.orig
sudo cat ./conf/logrotate.append.conf >> /etc/logrotate.conf
