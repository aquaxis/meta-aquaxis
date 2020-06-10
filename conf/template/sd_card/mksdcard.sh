#!/bin/bash

DEVICE=/dev/sdb

sudo umount ${DEVICE}*
sudo parted -s -a optimal ${DEVICE} mklabel msdos
sudo parted -s -a optimal ${DEVICE} mkpart primary fat32 1 512
sudo parted -s -a optimal ${DEVICE} mkpart primary ext4 513 100%
sudo mkfs.vfat -n BOOT ${DEVICE}1
sudo mkfs.ext4 -F -L ROOT ${DEVICE}2

sudo mount ${DEVICE}1 /mnt
sudo cp BOOT.BIN /mnt
sudo cp Image /mnt
sudo cp zynqmp-ultra96-v2.dtb /mnt
sudo mkdir -p /mnt/extlinux
sudo cp extlinux.conf /mnt/extlinux
sync
sudo umount ${DEVICE}*
sudo mount ${DEVICE}2 /mnt
sudo tar xzvf core-image-minimal-ultra96v2.tar.gz -C /mnt
sync
sudo umount ${DEVICE}*
