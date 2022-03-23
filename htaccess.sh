#!/bin/sh

sudo mkdir -p /etc/apache2/auth/

sudo cat > /etc/apache2/auth/.htpasswd  <<EOF
admin:{SHA}JI7s6SlEh2zY/uHCOlHL3rGg31k=
EOF

sudo cat > /var/www/demo1.test/html/.htaccess  <<EOF
AuthType basic
AuthName "restricted area"
AuthUserFile "/etc/apache2/auth/.htpasswd"
require valid-user
EOF

sudo systemctl reload apache2
