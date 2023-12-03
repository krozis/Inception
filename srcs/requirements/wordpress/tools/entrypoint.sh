#!/bin/sh

# Wait for MariaDB to be running
until mariadb --host=mariadb --user=$MY_USER --password=$MY_PASSWORD -e '\c' &>/dev/null; do
  echo >&2 "mariadb is unavailable - sleeping"
  sleep 3
done

echo "mariadb is available"

# If not already configured, create the config file.
if [ ! -f "wp-config.php" ]; then
	wp core download
 	wp config create --dbname=$DB_NAME --dbuser=$MY_USER --dbpass=$MY_PASSWORD --dbhost=mariadb --dbcharset="utf8" --dbcollate="utf8_general_ci"
 	wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE"  --admin_user="$WP_ADMIN" --admin_email="$WP_ADMIN"@"$DOMAIN_NAME" --admin_password="$WP_ADMIN_PASSWORD" --skip-email
	wp user create "$MY_USER" "$MY_USER"@"$DOMAIN_NAME" --user_pass="$MY_PASSWORD"
	wp plugin update --all
fi

# Change the theme for 2022
#wp theme activate twentytwentytwo

# Run PHP-FPM
php-fpm81 -F
