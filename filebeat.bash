#Acquiring of filebeat

sudo curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.6.2-amd64.deb
sudo dpkg -i filebeat-6.6.2-amd64.deb

# swapping for more memory
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

# alter the filebeat.yaml

sudo nano /etc/filebeat/filebeat.yml
sudo service filebeat start