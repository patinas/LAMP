#!/bin/sh
sudo chmod +x *.sh
apt update && apt upgrade -y

sudo cat > /etc/hosts <<EOF
127.0.0.1 localhost.localdomain   localhost
# This line should be changed to the correct servername:
127.0.1.1 us.demo.test us

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
EOF

sudo cat > /etc/hostname <<EOF
us
EOF


systemctl reboot

