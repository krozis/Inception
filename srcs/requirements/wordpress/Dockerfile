FROM alpine:3.17

LABEL "author"="stelie"

# Specify which software versions to use.
ENV WP_VERSION=6.4.1
ENV PHP_VERSION=php81

# Install prerequisites for Wordpress + PHP
RUN apk update && apk upgrade && apk add --no-cache \
    wget \
    tar \
	mariadb-client \
    $PHP_VERSION \
    $PHP_VERSION-fpm \
    $PHP_VERSION-mysqli \
	$PHP_VERSION-phar

#COPY conf/php.conf /etc/php81/php-fpm.d/www.conf

# Install Wordpress
WORKDIR /var/www/stelie.42.fr
RUN wget https://wordpress.org/wordpress-$WP_VERSION.tar.gz -O wp.tar.gz
RUN tar xzf wp.tar.gz && rm wp.tar.gz && mv wordpress/* . && rmdir wordpress
RUN chown -R root:root /var/www/stelie.42.fr

# Installing Wordpress CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp


COPY /tools/entrypoint.sh /tmp/entrypoint.sh

ENTRYPOINT [ "sh", "/tmp/entrypoint.sh" ]
