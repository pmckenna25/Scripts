#!/bin/bash
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
apt-get install apache2 php libapache2-mod-php awscli -y
rm -rf /var/www/html/*
aws s3 cp --recursive s3://bvdevphotobucket/ /var/www/html
