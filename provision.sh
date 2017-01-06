#!/bin/bash

## Jaziel Lopez <juan.jaziel@gmail.com>
## Provision file
## Apache
## PHP 7
## MySQL

echo "Install Software Properties Common" && \
    apt-get install software-properties-common python-software-properties -y

echo "Adding PPA PHP 7.0" && \
    add-apt-repository ppa:ondrej/php

echo "Updating apt-repositories" && \
    apt-get update -y

echo "Installing debconf, vim, Git" && \
    apt-get install curl debconf-utils  -y

echo "Installing PHP FPM 7.0" && \
    apt-get install php7.0 php7.0-fpm php7.0-mysql php7.0-mcrypt php7.0-curl php7.0-xml php7.0-soap -y

echo "Setup passwordless mysql root installation" && \
    debconf-set-selections <<< "mysql-server mysql-server/root_password password root" && \
    debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

echo "Installing MySQL" && \
    apt-get install -y mysql-server mysql-client

echo "Installing  apache2" && \
    apt-get install apache2 libapache2-mod-php7.0 -y
