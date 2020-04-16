# Recompile with:
# cd /media/alex/boot/
# sudo mkimage -C none -A arm -T script -d bpi-m2-zero_boot.cmd bpi-m2-zero_boot.scr

setenv disp_mode "1280x720p60"
setenv extra "consoleblank=0 hdmi.audio=EDID:0 disp.screen0_output_mode=${disp_mode} sunxi_ve_mem_reserve=0 sunxi_g2d_mem_reserve=0 sunxi_fb_mem_reserve=16"
setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootfstype=ext4 rw rootwait fsck.repair=yes panic=10 ${extra}

fatload mmc 0 0x43000000 sun8i-h2-plus-bananapi-p2-zero.dtb
fatload mmc 0 0x45000000 zImage
bootz 0x45000000 - 0x43000000



#bootz ${kernel_addr} ${ramdisk_addr}:${ramdisk_size} ${dtb_addr}
