#!/bin/sh
passwd
adduser krozis
echo "http://dl-cdn.alpinelinux.org/alpine/v3.18/main" > /etc/apk/repositories
echo "http://dl-cdn.alpinelinux.org/alpine/v3.18/community" >> /etc/apk/repositories
git clone "https://github.com/krozis/Inception.git" /root/Inception
apk update
apk add sudo
apk add nano
apk add docker
apk add ufw
rc-update add docker default
rc-update add ufw default
echo "krozis ALL=(ALL) ALL" >> /etc/sudoers.d/sudo
rm /etc/init.d/install_2.sh