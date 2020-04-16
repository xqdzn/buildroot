#!/bin/sh

set -u
set -e

# Add a console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
	sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # Graphical window' ${TARGET_DIR}/etc/inittab
fi

# Copy DT
if [ -e ${BUILD_DIR}/linux-5*/arch/arm/boot/dts/sun8i-h2-plus-bananapi-p2-zero.dtb ]; then
    cp ${BUILD_DIR}/linux-5*/arch/arm/boot/dts/sun8i-h2-plus-bananapi-p2-zero.dtb ./output/images/
fi
