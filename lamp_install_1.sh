#!/bin/sh
sudo chmod +x *.sh
apt update && apt upgrade -y

apt install apache2 -y
apt install mysql-server -y
mysql_secure_installation

