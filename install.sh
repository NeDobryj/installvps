#!/usr/bin/env bash
SUPASSWORD=$1
apt-get purge nginx php5-fpm php5-mysql php5-curl php5-gd php-mail git mysql-server -y &&
apt-get autoremove nginx php5-fpm php5-mysql php5-curl php5-gd php-mail git mysql-server -y &&
apt-get update -y

# install web server
apt-get install nginx php5-fpm php5-mysql php5-curl php5-gd php-mail git -y  &&
echo "mysql-server-5.5 mysql-server/root_password password $SUPASSWORD" | debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password_again password $SUPASSWORD" | debconf-set-selections
apt-get install mysql-server -y &&

# config file
# nginx setting - default
# nginx index.html - default

# config nginx defolde

mkdir /var/www/default-host/ &&
mkdir /var/www/git/ &&
#config nginx
cd /etc/nginx/ &&
rm nginx.conf &&
thoch nginx.conf &&

echo "user www-data;" >> nginx.conf &&
echo "worker_processes 1; " >> nginx.conf &&
echo "pid /run/nginx.pid; " >> nginx.conf &&
echo " " >> nginx.conf &&
echo "events { " >> nginx.conf &&
echo "	worker_connections 768; " >> nginx.conf &&
echo "} " >> nginx.conf &&
echo " " >> nginx.conf &&
echo "http { " >> nginx.conf &&
echo "	sendfile on; " >> nginx.conf &&
echo "	tcp_nodelay on; " >> nginx.conf &&
echo "	keepalive_timeout 65; " >> nginx.conf &&
echo "	types_hash_max_size 2048; " >> nginx.conf &&
echo "	include /etc/nginx/mime.types; " >> nginx.conf &&
echo "	default_type application/octet-stream; " >> nginx.conf &&
echo "	access_log /var/log/nginx/access.log; " >> nginx.conf &&
echo "	error_log /var/log/nginx/error.log; " >> nginx.conf &&
echo "	gzip on; " >> nginx.conf &&
echo "	gzip_disable "msie6"; " >> nginx.conf &&
echo "	include /etc/nginx/conf.d/*.conf; " >> nginx.conf &&
echo "	include /etc/nginx/sites-enabled/*; " >> nginx.conf &&
echo "} " >> nginx.conf &&

cd /etc/nginx/sites-available/ &&
rm default &&
echo "server {" >> default &&
echo "	listen 80 ; " >> default &&
echo "	listen [::]:80 ipv6only=on; " >> default &&
echo " " >> default &&
echo "	root /var/www/default-host/; " >> default &&
echo "	index index.html index.htm; " >> default &&
echo "	server_name localhost; " >> default &&
echo "	location / { " >> default &&
echo "		try_files $uri $uri/ =404; " >> default &&
echo "	} " >> default &&
echo "} " >> default &&




# nginx
cd /etc/nginx/sites-enabled/ &&
rm default-host &&
touch default-host &&
#----
echo "server {" >> default-host &&
echo "    listen       80 default;" >> default-host &&
echo " " >> default-host &&
echo "    access_log  /var/log/nginx/default-host.access.log;" >> default-host &&
echo " " >> default-host &&
echo "    location / {" >> default-host &&
echo "        root   /var/www/default-host/;" >> default-host &&
echo "        index  index.html index.htm;" >> default-host &&
echo "    }" >> default-host &&
echo "}" >> default-host &&

# index.html
cd /var/www/default-host/ &&
rm index.html &&
touch index.html &&
#----
echo "<!DOCTYPE html>" >> index.html &&
echo "<html>" >> index.html &&
echo "  <head>" >> index.html &&
echo "    <meta charset="utf-8">" >> index.html &&
echo "    <title>microcrm</title>" >> index.html &&
echo "  </head>" >> index.html &&
echo "  <body>" >> index.html &&
echo "    <h2>microcrm</h2>" >> index.html &&
echo "  </body>" >> index.html &&
echo "</html>" >> index.html &&
cd ~ &&
clear &&
echo "End install Nginx, MySQL, PHP, GIT and config file"
