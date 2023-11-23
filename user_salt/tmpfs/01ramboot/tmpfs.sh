#!/usr/bin/bash

read line

case "${line:-Nn}" in
        [Yy]* )
                mkdir /mnt
                umount /sysroot
                mount /dev/mapper/qubes_dom0-root /mnt
                modprobe zram
                echo 10G > /sys/block/zram0/disksize
                /mnt/usr/sbin/mkfs.ext2 /dev/zram0
				mount /dev/zram0 /sysroot
                cp -a /mnt/* /sysroot
                exit 0
                ;;
        [Nn]* )
                exit 0
                ;;
        * )
                exit 1
                ;;
esac

