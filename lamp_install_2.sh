#!/bin/sh
sudo chmod +x *.sh
apt update && apt upgrade -y

apt install php libapache2-mod-php php-mysql -y
sudo apt install php-curl php-json php-cgi -y
