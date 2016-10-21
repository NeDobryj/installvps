#!/bin/bash

NAME=$1
PASSWORD=$2
BD_USERNAME=$3
BD_PASSWORD=$4
HOST=$5
SUPASSWORD=$6
DOMIAN=$7

# user add
useradd -d /home/${NAME} -m /home/${NAME} ${NAME} -p ${PASSWORD} &&
#------
mkdir -p /home/${NAME}/www/${DOMIAN}/master/ &&
mkdir -p /home/${NAME}/www/${DOMIAN}/demo/ &&
#------
mkdir -p /home/${NAME}/git/demo-${DOMIAN}.git &&
mkdir -p /home/${NAME}/git/master-${DOMIAN}.git &&
#------

# demo
touch /etc/nginx/sites-enabled/${NAME}-config-demo &&

echo "server {" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   listen 80;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   server_name demo.${DOMIAN};" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   root /home/${NAME}/www/${DOMIAN}/demo/;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   index index.php;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   gzip on;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   gzip_disable 'msie6';" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript application/javascript;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   location ~ /\. {" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "      deny all;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   }" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   location ~* /(?:uploads|files)/.*\.php$ {" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "      deny all;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   }" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   location ~* ^.+\.(ogg|ogv|svg|svgz|eot|otf|woff|mp4|ttf|rss|atom|jpg|jpeg|gif|png|ico|zip|tgz|gz|rar|bz2|doc|xls|exe|ppt|tar|mid|midi|wav|bmp|rtf)$ {" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "      access_log off;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "      log_not_found off;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "      expires max;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   }" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   location / {" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "      try_files $uri $uri/ /index.php?$args;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   }" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   location ~ \.php$ {" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "	    try_files $uri = 404;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "      include fastcgi_params;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "      fastcgi_pass  unix:/var/run/php5-fpm.sock;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "      fastcgi_index index.php;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "      fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "  }" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   access_log  /var/log/nginx/journalwe.ru_access.log combined;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   error_log   /var/log/nginx/journalwe.ru_error.log;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "}" >> /etc/nginx/sites-enabled/${NAME}-config &&

# master
touch /etc/nginx/sites-enabled/${NAME}-config-master &&
echo "server {" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   listen 80;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   server_name ${DOMIAN};" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   root /home/${NAME}/www/${DOMIAN}/master/;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   index index.php;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   gzip on;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   gzip_disable 'msie6';" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript application/javascript;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   location ~ /\. {" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "      deny all;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   }" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   location ~* /(?:uploads|files)/.*\.php$ {" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "      deny all;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   }" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   location ~* ^.+\.(ogg|ogv|svg|svgz|eot|otf|woff|mp4|ttf|rss|atom|jpg|jpeg|gif|png|ico|zip|tgz|gz|rar|bz2|doc|xls|exe|ppt|tar|mid|midi|wav|bmp|rtf)$ {" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "      access_log off;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "      log_not_found off;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "      expires max;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   }" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   location / {" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "      try_files $uri $uri/ /index.php?$args;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   }" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   location ~ \.php$ {" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "	    try_files $uri = 404;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "      include fastcgi_params;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "      fastcgi_pass  unix:/var/run/php5-fpm.sock;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "      fastcgi_index index.php;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "      fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "  }" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   access_log  /var/log/nginx/journalwe.ru_access.log combined;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "   error_log   /var/log/nginx/journalwe.ru_error.log;" >> /etc/nginx/sites-enabled/${NAME}-config &&
echo "}" >> /etc/nginx/sites-enabled/${NAME}-config &&


# musql
# demo
# Login: DEMO_USERNAME
# BD Name: DEMO_NAMEBASE
`mysql --user=DEMO_$BD_USERNAME --password=$BD_PASSWORD -e "CREATE DATABASE DEMO_$NAME"` &&
# demo
# Login: MASTER_USERNAME
# BD Name: MASTER_NAMEBASE
`mysql --user=MASTER_$BD_USERNAME --password=$BD_PASSWORD -e "CREATE DATABASE MASTER_$NAME"` &&


# git demo
cd /home/${NAME}/git/demo-${DOMIAN}.git
git init --bare

# hooks demo
touch /home/${NAME}/git/demo-${DOMIAN}.git/hooks/post-receive &&

echo '#!/bin/bash' >> /home/${NAME}/git/demo-${DOMIAN}.git/hooks/post-receive &&
echo 'siteroot="/home/${NAME}/www/${DOMIAN}/demo/"' >> /home/${NAME}/git/demo-${DOMIAN}.git/hooks/post-receive &&
echo 'while read oldrev newrev ref' >> /home/${NAME}/git/demo-${DOMIAN}.git/hooks/post-receive &&
echo 'do' >> /home/${NAME}/git/demo-${DOMIAN}.git/hooks/post-receive &&
echo '  branch=`echo $ref | cut -d/ -f3`' >> /home/${NAME}/git/demo-${DOMIAN}.git/hooks/post-receive &&
echo '  if [ "master" == "$branch" ]; then' >> /home/${NAME}/git/demo-${DOMIAN}.git/hooks/post-receive &&
echo '    git archive master | tar -x -C $siteroot' >> /home/${NAME}/git/demo-${DOMIAN}.git/hooks/post-receive &&
echo '  fi' >> /home/${NAME}/git/demo-${DOMIAN}.git/hooks/post-receive &&
echo 'done' >> /home/${NAME}/git/demo-${DOMIAN}.git/hooks/post-receive &&

# git master
cd /home/${NAME}/git/master-${DOMIAN}.git &&
git init --bare

# hooks demo
touch /home/${NAME}/git/master-${DOMIAN}.git/hooks/post-receive &&

echo '#!/bin/bash' >> /home/${NAME}/git/master-${DOMIAN}.git/hooks/post-receive &&
echo 'siteroot="/home/${NAME}/www/${DOMIAN}/master/"' >> /home/${NAME}/git/master-${DOMIAN}.git/hooks/post-receive &&
echo 'while read oldrev newrev ref' >> /home/${NAME}/git/master-${DOMIAN}.git/hooks/post-receive &&
echo 'do' >> /home/${NAME}/git/master-${DOMIAN}.git/hooks/post-receive &&
echo '  branch=`echo $ref | cut -d/ -f3`' >> /home/${NAME}/git/master-${DOMIAN}.git/hooks/post-receive &&
echo '  if [ "master" == "$branch" ]; then' >> /home/${NAME}/git/master-${DOMIAN}.git/hooks/post-receive &&
echo '    git archive master | tar -x -C $siteroot' >> /home/${NAME}/git/master-${DOMIAN}.git/hooks/post-receive &&
echo '  fi' >> /home/${NAME}/git/master-${DOMIAN}.git/hooks/post-receive &&
echo 'done' >> /home/${NAME}/git/master-${DOMIAN}.git/hooks/post-receive &&

#chmod sh

chmod ${NAME}:${NAME} /home/${NAME}/* -R &&

chmod 777 /home/${NAME}/git/master-${DOMIAN}.git/hooks/post-receive  &&
chmod 777 /home/${NAME}/git/demo-${DOMIAN}.git/hooks/post-receive &&

clear &&
echo "End add new www, git repo"
