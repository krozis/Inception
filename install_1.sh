#!/bin/sh

passwd
adduser krozis
setup-hostname -n alpinception
setup-keymap us us-altgr-intl
setup-timezone -z UTC

echo "http://dl-cdn.alpinelinux.org/alpine/v3.18/main" > /etc/apk/repositories
echo "http://dl-cdn.alpinelinux.org/alpine/v3.18/community" >> /etc/apk/repositories

yes | setup-disk -q -m sys /dev/sda
setup-sshd -c openssh
setup-ntp -c chrony
poweroff
