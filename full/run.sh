#!/bin/bash

VOLUME_HOME="/var/lib/mysql"

if [[ ! -d $VOLUME_HOME/mysql ]]; then
    echo "=> An empty or uninitialized MySQL volume is detected in $VOLUME_HOME"
    echo "=> Installing MySQL ..."
    mysql_install_db > /dev/null 2>&1
    echo "=> Done!"
    /create-mysql-admin-user.sh
else
    echo "=> Using an existing volume of MySQL"
fi

if [-e /var/www/html/* ]; 
then
    exec /sbin/my_init
else
    mv /tmp/itop/web/* /var/www/html
    chown -R www-data:root /var/www/html
    exec /sbin/my_init
fi