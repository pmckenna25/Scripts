#!/bin/bash
adduser hadoop
mkdir -p /data/zookeeper
chown -R hadoop:hadoop /data
wget http://apache.mirrors.nublue.co.uk/zookeeper/stable/zookeeper-3.4.13.tar.gz
tar -xvf zookeeper-3.4.13.tar.gz
chown hadoop:hadoop -R zookeeper-3.4.13