#!/bin/bash

openssl req -x509 -days 365 -newkey rsa:2048 -nodes \
    -keyout $NGINX_SELFSIGNED_KEY \
    -out $NGINX_CERTIFICATE \
    -subj "/C=FR/ST=Paris/O=42Born2Code/CN=stelie.42.fr"


