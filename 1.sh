#!/bin/sh
adduser krozis
echo "http://dl-cdn.alpinelinux.org/alpine/v3.18/main" > /etc/apk/repositories
echo "http://dl-cdn.alpinelinux.org/alpine/v3.18/community" >> /etc/apk/repositories
apk update
apk add sudo
apk add nano
apk add docker
apk add ufw
rc-update add docker default
rc-update add ufw default
echo "krozis ALL=(ALL) ALL" >> /etc/sudoers.d/sudo
