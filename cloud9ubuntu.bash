#!/bin/bash

# set local timezone
locale-gen en_GB.UTF-8
update-locale LANG=en_GB.UTF-8


# making an IDE environment in AWS
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
apt-get install apache2 php libapache2-mod-php php-mysql -y
rm /var/www/html/index.html
touch /var/www/html/index.php

# download and install node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
export NVM_DIR="/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
echo 'export NVM_DIR="/.nvm"' | tee --append /home/ubuntu/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' | tee --append /home/ubuntu/.bashrc
nvm install 6.*

# download and install python 2
apt-get install python-minimal python-pip -y
pip install awscli

# get ruby for code deploy
apt-get install ruby -y
curl -O https://aws-codedeploy-us-east-1.s3.amazonaws.com/ls
./install auto

# can be checked via cat .gitconfig
git config --global credential.helper '!aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true

# make folder for c9 environment
mkdir cloud9

# nano .ssh/authorized_keys
# this echo option contains a dead account key
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC0vG+BykUZ/ZgAxNEk80ocIJSRV5vKPhCpLyHzYOYPJTFr6XuQ4ZplKflzGUSREzezdGDovchj01bFCQ5niIWMnHUBaGMZCSDy6Z/HZ1pF9raF48376JgdLa4ncVJRyivCvqpAVnxrx08Of3rivBJnzL08odQaW02gBpFUA1tz+i8hFxYAjUBVRI7fMgmZdiDxlGHxBObJPrBakOD1SKFPjhBgO0B1SEsxbBcAqG2doLskX1hQXKgoto/lmp/7zh1DTSlYNmmULJL45qyrei5HsjrXeHPVJXXij119yT8hVYE5+oAikn2PCpA2JJGMlFryS6pRNstLZaHkFHyD/7GE6FPkG5n9uSYDGzKt7y1Gg0vLf8Cgv98YxXaeXvAz73J/U4t5SxeP1T0/q7ttLHfRzfFiYD1IB6cpyBQmp/nmB7EN+yfaRoOZX44LlJF2+WOrGhYtPqFbr1LYEq79Jg7ZdT2pAQAThgjvZnGHTwf00q5MtIe4YaxpQwIpTVJ+kOqZM/zxqFxTg4X+lVbTW1BsxEULVdJ0WxWo1NFAHsU7WNLApboDBV69AyFi6zSA4d656owRCQrs9BO6p3OO7HLIXqViJEsLTDps4u/6KZ8anOI6mZkoorhP8jxPo5KXsnStLmOWXaoi7Bk72kNVJ4gYnDG+HuZzr8aPeTVfGYhFbw== vocstartsoft+536302443903@cloud9.amazon.com' | tee --append .ssh/authorized_keys


