#!/bin/sh

until mariadb --host=mariadb --user=$MY_USER --password=$MY_PASSWORD -e '\c'; do
  echo >&2 "mariadb is unavailable - sleeping"
  sleep 3
done

while true; do
	sleep 10
done

 if ! -e wp-config.php ; then
 	wp config create --dbname=$DB_NAME --dbuser=$MY_USER --dbpass=$MY_PASSWORD --dbhost=mariadb --skip-check
 	wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE"  --admin_user="$WP_ADMIN" --admin_email="$WP_ADMIN_MAIL" --admin_password="$WP_ADMIN_PASSWORD"
done
# exec "$@"


