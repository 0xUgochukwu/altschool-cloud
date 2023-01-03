#!/bin/bash
sudo apt update
sudo apt install -y nginx
sudo apt install -y ufw
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx Full'
sudo ufw allow 'OpenSSH'
systemctl start nginx
systemctl enable nginx
echo "<h1>I am $(hostname -f)</h1>" > /var/www/html/index.html
