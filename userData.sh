#!/bin/bash
sudo apt update
sudo apt install -y nginx
sudo apt install -y ufw
systemctl start nginx
systemctl enable nginx
sudo ufw enable
echo "<h1>I am $(hostname -f)</h1>" > /var/www/html/index.html
