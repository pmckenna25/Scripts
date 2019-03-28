#!/bin/bash

# update upgrade
apt-get update -y

# required java install
apt-get install openjdk-8-jdk -y

# install the emodb binaries
cd ../home/ubuntu
wget http://github.com/bazaarvoice/emodb/releases/download/emodb-5.7.1/emodb-5.7.1-binaries.tar.gz
tar -xzf emodb-5.7.1-binaries.tar.gz
mkdir opt
cd opt
mv emodb-5.7.1 opt/emodb

opt/emodb/start-local.sh &

# test with this command
#curl -s "http://localhost:8081/ping"

# input data with this command
# curl -s -XPUT -H "Content-Type: application/json" "http://localhost:8080/sor/1/_table/review:testcustomer?options=placement:'ugc_global:ugc'&audit=comment:'initial+provisioning' --data-binary '{"type":"review", "client":"TestCustomer"}' -H "X-BV-API-Key: local_admin"

# test input
# curl -s "http://localhost:8080/sor/1/_table/review:testcustomer" -H "X-BV-API-Key: local_admin"