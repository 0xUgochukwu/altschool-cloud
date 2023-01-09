#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y nginx
sudo apt install -y ufw
systemctl start nginx
systemctl enable nginx
sudo ufw -y enable
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx Full'
sudo ufw allow 'OpenSSH'
echo "<h1>Good day from $(hostname -f)</h1>" > /var/www/html/index.html
