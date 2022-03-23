#!/bin/sh
sudo chmod +x *.sh
apt update && apt upgrade -y

sudo ln -s /etc/apache2/mods-available/cgi.load /etc/apache2/mods-enabled/
sudo systemctl restart apache2

sudo cat > /usr/lib/cgi-bin/uptime.cgi  <<EOF
#!/bin/sh -
echo "Content-Type: text/plain"
echo ""
/usr/bin/uptime
EOF

sudo chmod 755 /usr/lib/cgi-bin/uptime.cgi

systemctl reload apache2 
