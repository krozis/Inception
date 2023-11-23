#!/bin/sh

service mariadb start
mariadb -e "\
    CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} ; \
    CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'; \
    GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%'; \
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; \
    FLUSH PRIVILEGES; \
    "
service mariadb restart
#mysqladmin --user=root --password=$MYSQL_ROOT_PASSWORD shutdown
