#!/bin/sh

set -u
set -e

# Add a console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
	sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window' ${TARGET_DIR}/etc/inittab
fi

# Copy DT
# if [ -e ${BUILD_DIR}/linux-${LINUX_VERSION}/arch/arm/boot/dts/${} ]; then
#     grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
# 	sed -i '/GENERIC_SERIAL/a\
# tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window' ${TARGET_DIR}/etc/inittab
# fi

# Delete unnecessary driver
if [ -e ${TARGET_DIR}/lib/firmware/brcmm ]; then
    rm (${TARGET_DIR}/lib/firmware/brcm/*431*) \
    rm (${TARGET_DIR}/lib/firmware/brcm/*432*) \
    rm (${TARGET_DIR}/lib/firmware/brcm/*433*) \
    rm (${TARGET_DIR}/lib/firmware/brcm/*43430a0*) \
    rm (${TARGET_DIR}/lib/firmware/brcm/*4345*) \
    rm (${TARGET_DIR}/lib/firmware/brcm/*435*) \
    rm (${TARGET_DIR}/lib/firmware/brcm/*436*) 
fi
