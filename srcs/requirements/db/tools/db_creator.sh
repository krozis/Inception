#!/bin/sh

if [ ! -d /var/lib/mysql/$MYSQL_DATABASE ]; then
  mysql_install_db
  /usr/share/mariadb/mysql.server start
  mysql -e "\
    CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} ; \
    CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'; \
    GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%'; \
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; \
    FLUSH PRIVILEGES; \
    "
  mysqladmin --user=root --password=$MYSQL_ROOT_PASSWORD shutdown
fi

exec "$@"