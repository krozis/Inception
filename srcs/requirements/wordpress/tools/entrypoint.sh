#!/bin/sh

until mysql --host=mariadb --user=$MYSQL_USER --password=$MYSQL_PASSWORD -e '\c'; do
  echo >&2 "mariadb is unavailable - sleeping"
  sleep 1
done

if ! wp core is-installed; then
	wp core download
	wp config create --dbname=$DB_NAME --dbuser=$MY_USER --dbpass=$MY_PASSWORD --dbhost=mariadb
	wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" \
    --admin_user="$WP_ADMIN" --admin_email="$WP_ADMIN_MAIL" --admin_password="$WP_ADMIN_PASSWORD"

exec "$@"