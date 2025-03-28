#! /bin/bash
yum install httpd git -y
systemctl start httpd
systemctl status httpd
cd /var/www/html
git clone https://github.com/Bindu818/New-Infra-3Tier.git
mv New-Infra-3Tier/*.
