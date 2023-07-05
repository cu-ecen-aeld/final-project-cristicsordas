#!/bin/sh

set -u
set -e

# Add a console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
	sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
fi

cp -f "package/busybox/S10mdev" "${TARGET_DIR}/etc/init.d/S10mdev"
chmod 755 ${TARGET_DIR}/etc/init.d/S10mdev
cp -f "package/busybox/mdev.conf" "${TARGET_DIR}/etc/mdev.conf"
cp -f "../base_external/post_build/interfaces" "${TARGET_DIR}/etc/network/interfaces"
cp -f "../base_external/post_build/wpa_supplicant.conf" "${TARGET_DIR}/etc/wpa_supplicant.conf"
