#!/bin/sh
sudo chmod +x *.sh
apt update && apt upgrade -y

# Virtual Hosts

mkdir -p /var/www/demo1.test/html
mkdir -p /var/www/demo2.test/html



# PHP info page
sudo cat > /var/www/demo1.test/html/info.php  <<EOF
<?php

// Show all information, defaults to INFO_ALL
phpinfo();

// Show just the module information.
// phpinfo(8) yields identical results.
phpinfo(INFO_MODULES);

?>
EOF

sudo cat > /var/www/demo2.test/html/info.php  <<EOF
<?php

// Show all information, defaults to INFO_ALL
phpinfo();

// Show just the module information.
// phpinfo(8) yields identical results.
phpinfo(INFO_MODULES);

?>
EOF





# The 2 sites
sudo cat > /var/www/demo1.test/html/index.html  <<EOF
<!DOCTYPE html>
<html>
<body>
    <h1>Welcome to DEMO 1</h1>
</body>
</html>
EOF


sudo cat > /var/www/demo2.test/html/index.html  <<EOF
<!DOCTYPE html>
<html>
<body>
    <h1>Welcome to DEMO 2</h1>
</body>
</html>
EOF




# Apache config
sudo cat > /etc/apache2/sites-available/demo1.conf  <<EOF
<VirtualHost *:80>
    ServerName demo1.test
    DocumentRoot /var/www/demo1.test/html
</VirtualHost>
EOF

sudo cat > /etc/apache2/sites-available/demo2.conf  <<EOF
<VirtualHost *:80>
    ServerName demo2.test
    DocumentRoot /var/www/demo2.test/html
</VirtualHost>
EOF


a2ensite demo1.conf
a2ensite demo2.conf
systemctl reload apache2
