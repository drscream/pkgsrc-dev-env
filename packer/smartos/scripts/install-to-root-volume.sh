#!/usr/bin/env bash

set -ex

function install_to_root_volume()
{
    local iso
    local root_volume
    local sector_count

    iso=$(disklist -r | head -n1)
    root_volume=$(disklist -n | awk '{print $1; exit}')

    mkdir /mnt-cdrom
    mount -F hsfs "/dev/dsk/${iso}p0" /mnt-cdrom

    cat <<EOF | fdisk -F /dev/stdin "/dev/rdsk/${root_volume}p0"
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
EOF

    sector_count=$(iostat -En "${root_volume}" | awk '/^Size:/ { sub("<",""); print $3/512 - 2048 }') 

    fdisk -A "12:128:0:0:0:0:0:0:2048:${sector_count}" "/dev/rdsk/${root_volume}p0"
    echo y|mkfs -F pcfs -o fat=32 "/dev/rdsk/${root_volume}p0:c"

    mkdir /mnt-boot
    mount -F pcfs "/dev/dsk/${root_volume}p1" /mnt-boot

    rsync -a /mnt-cdrom/ /mnt-boot/

    grub --batch <<EOF >/dev/null 2>&1
device (hd0) /dev/dsk/${root_volume}p0
root (hd0,0)
install /boot/grub/stage1 (hd0) (hd0,0)/boot/grub/stage2 p (hd0,0)/boot/grub/menu.lst
quit
EOF

    sed -i '' -e 's%kernel /platform/%kernel (hd0,0)/platform/%' \
        -e 's%module /platform/%module (hd0,0)/platform/%' \
        /mnt-boot/boot/grub/menu.lst

    sed -i '' 's/timeout=.*/timeout=1/' /mnt-boot/boot/grub/menu.lst

    umount /mnt-cdrom
    rmdir /mnt-cdrom

    umount /mnt-boot
    rmdir /mnt-boot

    mkdir -p /opt/custom/{bin,smf}
}

install_to_root_volume
