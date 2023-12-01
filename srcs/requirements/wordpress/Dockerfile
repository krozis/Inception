FROM alpine:3.17

LABEL "author"="stelie"

# Specify which software versions to use.
ENV WP_VERSION=6.4.1
ENV PHP_VERSION=php81
ENV DOMAIN_NAME=stelie.42.fr

# Install prerequisites for Wordpress + PHP
RUN apk update && apk upgrade && apk add --no-cache \
    wget \
    tar \
	mariadb-client \
    $PHP_VERSION \
    $PHP_VERSION-fpm \
    $PHP_VERSION-mysqli \
	$PHP_VERSION-phar \
	$PHP_VERSION-mbstring \
	$PHP_VERSION-openssl \
	$PHP_VERSION-xml \
	$PHP_VERSION-tokenizer \
	$PHP_VERSION-session \ 
	$PHP_VERSION-fileinfo \
	$PHP_VERSION-exif \
	$PHP_VERSION-json \
	$PHP_VERSION-dom \
	$PHP_VERSION-iconv \
	$PHP_VERSION-curl \
	$PHP_VERSION-zip

# Copy the php.conf file
COPY conf/php.conf /etc/php81/php-fpm.d/www.conf

# Install Wordpress
WORKDIR /var/www/$DOMAIN_NAME
RUN wget https://wordpress.org/wordpress-$WP_VERSION.tar.gz -O wp.tar.gz
RUN tar xzf wp.tar.gz && rm wp.tar.gz && mv wordpress/* . && rmdir wordpress
RUN chown -R root:root /var/www/$DOMAIN_NAME

# Installing Wordpress CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Copy the script
COPY /tools/entrypoint.sh /tmp/entrypoint.sh

# Start from the entrypoint file
ENTRYPOINT [ "sh", "/tmp/entrypoint.sh" ]
