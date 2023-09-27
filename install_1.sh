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
cp ./install_2.sh /etc/init.d/install_2.sh
chmod +x /etc/init.d/install_2.sh
rc-update add /etc/init.d/install_2.sh boot
poweroff
