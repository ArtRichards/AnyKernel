#!/sbin/sh
cd /tmp/
/tmp/dd if=/dev/block/platform/sdhci-tegra.3/by-name/LNX of=/tmp/boot.img
/tmp/unpackbootimg /tmp/boot.img
/tmp/mkbootimg --kernel /tmp/zImage --ramdisk /tmp/boot.img-ramdisk.gz --base 0x10000000 -o /tmp/newboot.img
/tmp/dd if=/tmp/newboot.img of=/dev/block/platform/sdhci-tegra.3/by-name/LNX
busybox chmod 644 /system/lib/modules/*
