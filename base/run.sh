#!/bin/bash
if [-e /var/www/html/* ]; 
then
    exec /sbin/my_init
else
    mv /tmp/itop/web/* /var/www/html
    chown -R www-data:root /var/www/html
    exec /sbin/my_init
fi