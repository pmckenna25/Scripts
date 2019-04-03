#!/bin/bash
# update upgrade
apt-get update -y
# required java install
apt-get install openjdk-8-jdk -y
# get python 2.7 minimal
apt-get install python-minimal -y
cd ../home/ubuntu
# get cassandra 2.0.13
wget http://archive.apache.org/dist/cassandra/2.0.17/apache-cassandra-2.0.17-bin.tar.gz
# unzip
tar -xzvf apache-cassandra-2.0.17-bin.tar.gz
# create new directory
mkdir opt
#move and rename cassandra
mv apache-cassandra-2.0.17 opt/cassandra

# modify the opt/cassandra/conf/cassandra.yaml 
# seeds (not including the master) <private_ip>,<private_ip>,etc
# Listening_address = private ip of the node
# rpc_address = also the private ip of the node
# endpoint_snitch: Ec2Snitch
# take care of any iptable issues (iptables -L)
# modify the opt/cassandra/conf/cassandra-rackdc.properties
# dc = uk_dc (or w/e)
# rack = RAC1 for seeds, RAC2 for master
# modify opt/cassandra/conf/cqlshrc.sample
# validate = false
# sudo cp cqlshrc.sample cqlshrc
# sudo ./cassandra in all nodes


# https://www.digitalocean.com/community/tutorials/how-to-install-cassandra-and-run-a-single-node-cluster-on-ubuntu-14-04
# https://github.com/bazaarvoice/cassandra
