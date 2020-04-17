Intro
=====

This default configuration will allow you to start experimenting with the
buildroot environment for the Bananapi P2 Zero. With the current
configuration it will bring-up the board, and allow access through the
serial console.

Bananapi P2 Zero link:
http://www.banana-pi.org/m2pz.html

This configuration uses U-Boot mainline and kernel mainline.

How to build
============
```
$ make bananapi_p2_zero_defconfig
$ make
```
Note: you will need access to the internet to download the required
sources.

How to write the SD card
========================

Once the build process is finished you will have an image called "sdcard.img"
in the output/images/ directory.

Copy the bootable "sdcard.img" onto an SD card with "dd":
```
$ sudo dd if=output/images/sdcard.img of=/dev/sdX
$ sudo sync
```
Insert the micro SDcard in your Bananapi P2 Zero and power it up. The console
is on the serial line, ```115200 8N1```.

How to test WiFi 
==================

Wireless driver is not enabled by default, in order to use WiFi, you have to 
enable brcmfmac and connect to a network using iw:
```
modprobe brcmfmac
```

You will see ```wlan0``` listed in ```ip link```
