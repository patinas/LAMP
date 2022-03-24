#!/bin/sh
apt update && apt upgrade -y

# sudo cat > file <<EOF
# EOF

sudo apt install curl -y

sudo apt install docker.io docker-compose -y
sudo systemctl enable docker
sudo systemctl start docker

sudo docker run -d \
--name="portainer" \
--restart on-failure \
-p 9000:9000 \
-p 8000:8000 \
-v /var/run/docker.sock:/var/run/docker.sock \
-v portainer_data:/data \
portainer/portainer-ce:latest

docker run --name ispconfig \
-e MAILMAN_EMAIL_HOST=test.com \
-e MAILMAN_EMAIL=test@test.com \
-e MAILMAN_PASS=pass \
-d \
-v $(pwd)/mysql:/var/lib/mysql \
-v $(pwd)/www:/var/www \
-v $(pwd)/mail:/var/mail \
-p 20:20 \
-p 21:21 \
-p 30000-30009:30000-30009 \
-p 82:80 \
-p 444:443 \
-p 8080:8080 \
-p 54:53 \
-p 2222:22 \
jerob/docker-ispconfig /start.sh
