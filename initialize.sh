#!/bin/bash

###
# This script is mostly a documentation of what is installed
# and may not worked completely as a script.
###

# Setup time to use Amazon NTP servers
sudo apt-get install ntp ntpstat
sudo cp /etc/ntp.conf /etc/ntp.conf.orig
sudo bash -c 'echo "driftfile /var/lib/ntp/ntp.drift" > /etc/ntp.conf'
sudo bash -c 'echo "server 0.amazon.pool.ntp.org" >> /etc/ntp.conf'
sudo bash -c 'echo "server 1.amazon.pool.ntp.org" >> /etc/ntp.conf'
sudo bash -c 'echo "server 2.amazon.pool.ntp.org" >> /etc/ntp.conf'
sudo bash -c 'echo "server 3.amazon.pool.ntp.org" >> /etc/ntp.conf'
sudo bash -c 'echo "disable monitor" >> /etc/ntp.conf'
sudo bash -c 'echo "restrict default ignore" >> /etc/ntp.conf'
sudo service ntp restart


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

# Configure AWS cli
# http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html
aws configure
