#!/bin/bash
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
apt-get install apache2 awscli -y
rm -rf /var/www/html/*
aws s3 cp --recursive s3://week-10-assignment/ /var/www/html
