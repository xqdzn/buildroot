setenv bootdelay 0
setenv extra "consoleblank=0 hdmi.audio=EDID:0 disp.screen0_output_mode=1920x1080p60 sunxi_ve_mem_reserve=0 sunxi_g2d_mem_reserve=0 sunxi_fb_mem_reserve=16"
part uuid ${devtype} ${devnum}:${bootpart} uuid
setenv bootargs console=${console} root=PARTUUID=${uuid} rw rootwait ${extra}

if load ${devtype} ${devnum}:${bootpart} ${kernel_addr_r} zImage; then
  if load ${devtype} ${devnum}:${bootpart} ${fdt_addr_r} ${fdtfile}; then
    if load ${devtype} ${devnum}:${bootpart} ${ramdisk_addr_r} initrd.img; then
      bootz ${kernel_addr_r} ${ramdisk_addr_r}:${filesize} ${fdt_addr_r};
    else
      bootz ${kernel_addr_r} - ${fdt_addr_r};
    fi;
  fi;
fi
