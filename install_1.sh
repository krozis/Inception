#!/bin/sh

passwd
setup-hostname -n alpinception
setup-keymap us us-altgr-intl
setup-timezone -z UTC

echo "http://dl-cdn.alpinelinux.org/alpine/v3.18/main" > /etc/apk/repositories
echo "http://dl-cdn.alpinelinux.org/alpine/v3.18/community" >> /etc/apk/repositories

yes | setup-disk -q -m sys /dev/sda
setup-sshd -c openssh
setup-ntp -c chrony
apk update
apk add sudo
apk add nano
apk add docker
apk add ufw
rc-update add docker default
rc-update add ufw default
adduser krozis
echo "krozis ALL=(ALL) ALL" >> /etc/sudoers.d/sudo
poweroff
