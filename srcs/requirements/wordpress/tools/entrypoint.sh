#!/bin/sh

# Wait for MariaDB to be running
until mariadb --host=$DB_HOSTNAME --user=$MY_USER --password=$MY_PASSWORD -e '\c' &>/dev/null; do
  echo >&2 "mariadb is unavailable - sleeping"
  sleep 3
done

echo "mariadb is available"

if ! getent passwd www-data > /dev/null 2>&1; then
    addgroup -S www-data
    adduser -S -G www-data www-data
fi

# If not already configured, create the config file.
if [ ! -f "wp-config.php" ]; then

	wp core download
	chown -R www-data:www-data /var/www/*
	# Creation of the wp-config.php  
 	wp config create --allow-root --dbname=$DB_NAME \
		--dbuser=$MY_USER \
		--dbpass=$MY_PASSWORD \
		--dbhost=$DB_HOSTNAME \
		--url=https://${DOMAIN_NAME}
	chown -R www-data:www-data wp-config.php
	chmod -R 755 wp-config.php

	# Install of wordpress core
 	wp core install --allow-root --url=https://${DOMAIN_NAME} \
		--title="$WP_TITLE"  \
		--admin_user="$WP_ADMIN" \
		--admin_password="$WP_ADMIN_PASSWORD" \
		--admin_email="$WP_ADMIN"@"$DOMAIN_NAME" --skip-email

	# Creation of an user
	wp user create --allow-root "$MY_USER" "$MY_USER"@"$DOMAIN_NAME" \
		--user_pass="$MY_PASSWORD" \
		--role=author

	# Flush the cache
	wp cache flush --allow-root

fi

if [ ! -d /run/php81 ]; then
	mkdir /run/php81
fi

# Give Permissions to www-data user 
chown -R www-data:www-data /var/www/$DOMAIN_NAME/wp-includes
chown -R www-data:www-data /var/www/$DOMAIN_NAME/wp-content
chown -R www-data:www-data /var/www/$DOMAIN_NAME/wp-admin

# Change the theme for 2022
wp theme activate twentytwentytwo

# Run PHP-FPM
php-fpm81 -F
