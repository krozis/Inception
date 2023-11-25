#!/bin/sh

# Ensure if the /run/mysqld exists and gives ownership to mysql user.
if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

# Check if database exists.
if [ ! -d "/var/lib/mysql/mysql" ]; then
	
	# Gives ownership for /var/lib/mysql to mysql user.
	chown -R mysql:mysql /var/lib/mysql

	# Initializing the database
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

	# To create temporary file
	file="/tmp/pleasehelpmefinishthisprojectsoon"

	# Fill the tmp file with MySql commands.
	cat << EOF > $file
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM	mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';
CREATE DATABASE $DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '$MY_USER'@'%' IDENTIFIED by '$MY_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MY_USER'@'%';
FLUSH PRIVILEGES;
EOF

	# Use the tmp file to configure the database then remove it.
	/usr/bin/mysqld --user=mysql --bootstrap < $file
	rm -f $file

fi

# Modify configuration to allow network connections:

# Allow network use.
sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf

# Listen all network interfaces.
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

# Launch MariaDB server.
exec /usr/bin/mysqld --user=mysql --console