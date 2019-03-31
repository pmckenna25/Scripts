#!/bin/bash
# update upgrade
apt-get update -y
# required java install
apt-get install openjdk-8-jdk -y
# get python 2.7 minimal
apt-get install python-minimal
cd ../home/ubuntu
# get cassandra 2.0.13
wget http://archive.apache.org/dist/cassandra/2.0.13/apache-cassandra-2.0.13-bin.tar.gz
# unzip
tar -xzvf apache-cassandra-2.0.13-bin.tar.gz
# create new directory
mkdir opt
#move and rename cassandra
mv apache-cassandra-2.0.13 opt/cassandra


https://www.digitalocean.com/community/tutorials/how-to-install-cassandra-and-run-a-single-node-cluster-on-ubuntu-14-04