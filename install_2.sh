#!/bin/sh

apk update
apk add sudo
apk add nano
apk add docker
apk add ufw
rc-update add docker default
rc-update add ufw default
echo "krozis ALL=(ALL) ALL" >> /etc/sudoers.d/sudo
