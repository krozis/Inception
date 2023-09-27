#!/bin/sh

passwd
setup-hostname -n alpinception
setup-keymap us us-altgr-intl
setup-timezone -z UTC

echo "http://dl-cdn.alpinelinux.org/alpine/v3.18/main" > /etc/apk/repositories
echo "http://dl-cdn.alpinelinux.org/alpine/v3.18/community" >> /etc/apk/repositories

sleep 5

yes | setup-disk -q -m sys /dev/sda
setup-sshd -c openssh
setup-ntp -c chrony
sleep 5
apk update -y
apk add -y sudo nano docker ufw
sleep 5
rc-update add docker default
rc-update add ufw default
sleep 5
adduser -G sudo krozis
sleep 5
poweroff
