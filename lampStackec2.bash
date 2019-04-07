#!/bin/bash
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
apt-get install apache2 php libapache2-mod-php awscli mysql-client php-mysql -y
wget -c http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm /var/www/html/*
mv wordpress/* /var/www/html/
# personalise the bucket name
aws s3 cp s3://phil-bucket-eu-west/wp-config.php /var/www/html/wp-config.php
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/
service apache2 restart

# siteurl and home must be set to the loadbalancer url
# if you forget then you can change in the wp_options table of the mysql db
# UPDATE wp_options SET option_value = '<loadbalanceraddress>' WHERE option_name = 'siteurl';
# UPDATE wp_options SET option_value = '<loadbalanceraddress>' WHERE option_name = 'home';