#!/bin/sh
sudo chmod +x *.sh
apt update && apt upgrade -y


# Enable mod_proxy
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo a2enmod proxy_balancer
sudo a2enmod lbmethod_byrequests
sudo a2enmod ssl



# Config
sudo cat > /etc/apache2/sites-available/proxy.conf  <<EOF
<VirtualHost *:*>
    ProxyPreserveHost On

    ProxyPass / http://demo1.test:80/
    ProxyPassReverse / http://demo2.test:80/
</VirtualHost>
EOF

a2ensite proxy
systemctl reload apache2 
