#!/bin/sh
while true; do ping -c1 www.google.com > /dev/null && break; done

sudo apt update && sudo apt upgrade -y

sudo apt install curl -y

sudo apt install docker.io docker-compose -y
sudo systemctl enable docker
sudo systemctl start docker

sudo chmod +x *.sh
sudo docker pull joomla
sudo docker pull mysql
sudo docker run --name joomla_db -d -e MYSQL_ROOT_PASSWORD=test mysql
sudo docker run --name joomla_website --link joomla_db:mysql -d -p 81:80 joomla
