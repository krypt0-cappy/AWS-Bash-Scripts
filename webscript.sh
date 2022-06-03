#!/bin/sh
sudo yum update
sudo yum -y install httpd
sudo systemctl enable httpd
sudo systemctl start httpd.service
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --reload
sudo touch /var/www/html/index.html
sudo chown -R $USER:$USER /var/www/html/index.html
sudo echo "Welcome to my first webpage project using an Amazon EC2 Instance. Level Up In Tech Rocks!!!!" > /var/www/html/index.html
