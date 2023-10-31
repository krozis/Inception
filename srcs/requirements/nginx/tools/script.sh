#!/bin/bash

openssl req -x509 -days 365 -newkey rsa:2048 -nodes \
    -out /etc/ssl/certs/nginx_selfsigned.crt \
    -keyout /etc/ssl/private/nginx_selfsigned.key \
    -subj "/C=FR/ST=Paris/O=42Born2Code/CN=stelie.42.fr"
