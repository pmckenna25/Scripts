#!/bin/bash
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 68818C72E52529D4
echo "deb http://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list
apt-get update -y
apt-get install -y mongodb-org
systemctl start mongod
systemctl enable mongod

# to enable full remote access alter the  mongod.conf bindIp to 0.0.0.0