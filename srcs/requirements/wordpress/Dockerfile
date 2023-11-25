FROM alpine:3.17

LABEL "author"="stelie"

# Install Wordpress and his prerequisites for php
RUN apk update && apk upgrade && apk add --no-cache \
    wget \
    tar \
    php81 \
    php81-fpm \
    php81-mysqli \
    php81-json \
    php81-openssl \
    php81-curl \
    php81-zlib \
    php81-xml \
    php81-phar \
    php81-intl \
    php81-dom \
    php81-xmlreader \
    php81-ctype

COPY /tools/entrypoint.sh /tmp/entrypoint.sh

ENTRYPOINT [ "sh", "/tmp/entrypoint.sh" ]
