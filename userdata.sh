#!/bin/bash
sudo yum -y install httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "Deployed via Terraform with ELB" > /var/www/html/index.html