#!/bin/bash
# Script to install Arch Linux, inspired by
# https://github.com/frankebel/archinstall and
# https://wiki.archlinux.org/title/Installation_guide.

# Check UEFI 64-bit boot mode.
[ $(< /sys/firmware/efi/fw_platform_size) == 64 ] || exit

# Uncomment lines below and set values manually.
# drive=              # Drive to install Arch Linux. (default: first drive)
# swap_size=          # Swap size in GiB. Set 0 for none. (default: 0)

# Set default values.
drive_default=$(lsblk -dno NAME | grep -E '^nvme|^sd|^vd' | head -n 1)
drive=${drive:-$drive_default}
swap_size=${swap_size:-0}

# Partition disks.
# 1. Create 1024MB partition for EFI system.
# 2. Create root partition with remaining capacity.
fdisk /dev/$drive << FDISK_CMDS
g
n


+1024M
t
1
n



w
FDISK_CMDS

efi_system_partition=$(lsblk -rno NAME /dev/$drive | grep $drive.*1)
root_partition=$(lsblk -rno NAME /dev/$drive | grep $drive.*2)

# Format partitions.
mkfs.fat -F 32 /dev/$efi_system_partition
mkfs.btrfs /dev/$root_partition

# Mount filesystems.
mount /dev/$root_partition /mnt
mount --mkdir /dev/$efi_system_partition /mnt/boot

# Create swapfile.
if (( swap_size > 0 )); then
    dd if=/dev/zero of=/mnt/swapfile bs=1GiB count=$swap_size
    chmod 600 /mnt/swapfile
    mkswap /mnt/swapfile
    swapon /mnt/swapfile
fi
