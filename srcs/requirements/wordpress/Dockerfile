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
    php \
    php-fpm \
    php-mysqli \
	php-json \
	php-curl \
	php-dom \
	php-exif \
	php-fileinfo \
	php-mbstring \
	php-openssl \
	php-xml \
	php-phar \
	php-iconv \
	php-zip 
	#php-tokenizer \
	#php-session \ 
	

# Copy the php.conf file
COPY conf/php.conf /etc/$PHP_VERSION/php-fpm.d/www.conf

# Install Wordpress
# RUN wget https://wordpress.org/wordpress-$WP_VERSION.tar.gz -O wp.tar.gz
# RUN tar xzf wp.tar.gz && rm wp.tar.gz && mv wordpress/* . && rmdir wordpress
# RUN chown -R root:root /var/www/$DOMAIN_NAME

# Installing Wordpress CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp

WORKDIR /var/www/$DOMAIN_NAME

# Copy the script
COPY /tools/entrypoint.sh /tmp/entrypoint.sh

# Start from the entrypoint file
ENTRYPOINT [ "sh", "/tmp/entrypoint.sh" ]
