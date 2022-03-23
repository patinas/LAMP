#!/bin/sh
while true; do ping -c1 www.google.com > /dev/null && break; done
sudo apt update && sudo apt upgrade -y
sudo chmod u+x *.sh
cd ~/

wget https://prdownloads.sourceforge.net/webadmin/webmin_1.984_all.deb
sudo apt install ~/webmin_1.984_all.deb -y
sudo apt install bind9 -y
sudo rm webmin_1.984_all.deb
