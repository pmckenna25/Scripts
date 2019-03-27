#!/bin/bash
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
apt-get install apache2 awscli -y
rm -rf /var/www/html/*
aws s3 cp --recursive s3://week-10-assignment/ /var/www/html
