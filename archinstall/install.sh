#!/bin/bash
# Script to install Arch Linux, inspired by
# https://github.com/frankebel/archinstall and
# https://wiki.archlinux.org/title/Installation_guide.

# Uncomment lines below and set values manually.
# drive=              # Drive to install Arch Linux. (default: first drive)
# swap_size=          # Swap size in GiB. Set 0 for none. (default: 0)
# pass_root=          # Passphrase for root user. (default: pass)
# username=           # Username for regular user. (default: user)
# pass_user=          # Passphrase for regular user. (default: pass)
# hostname=           # hostname of the device. (default: arch)
# keymap=             # Keyboard mapping for console. (default: us-acentos)

# Set default values.
drive_default=$(lsblk -dno NAME | grep -E '^nvme|^sd|^vd' | head -n 1)

: ${drive:=$drive_default}
: ${swap_size:=0}
: ${pass_root:=pass}
: ${username:=user}
: ${pass_user:=pass}
: ${hostname:=arch}
: ${keymap:=us-acentos}

# Assert file existence.
[ -f chroot.sh ] || exit 1

# 1 Pre-installation

# 1.6 Verify UEFI 64-bit boot mode.
[ $(< /sys/firmware/efi/fw_platform_size) == 64 ] || exit 1

# 1.9 Partition the disks
# Create 512MB partition for EFI system.
# Create root partition with remaining capacity.
fdisk /dev/$drive << FDISK_CMDS
g
n


+512M
t
1
n



w
FDISK_CMDS

efi_system_partition=$(lsblk -rno NAME /dev/$drive | grep $drive.*1)
root_partition=$(lsblk -rno NAME /dev/$drive | grep $drive.*2)

# 1.10 Format the partitions
mkfs.fat -F 32 /dev/$efi_system_partition
mkfs.btrfs /dev/$root_partition

# 1.11 Mount the filesystems (flat hierarchy)
mount /dev/$root_partition /mnt
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@snapshots
btrfs subvolume create /mnt/@var_log
btrfs subvolume create /mnt/@var_cache
btrfs subvolume create /mnt/@var_tmp
(( swap_size > 0 )) && btrfs subvolume create /mnt/@swap
umount /mnt

# Mount subvolumes for root and home and efi partition
mount -o compress=zstd,subvol=@ /dev/$root_partition /mnt
mount --mkdir -o compress=zstd,subvol=@home /dev/$root_partition /mnt/home
mount --mkdir /dev/$efi_system_partition /mnt/efi

# Mount subvolumes to avoid bloating the snapshots with unnecessary data
# https://wiki.archlinux.org/title/Snapper#Suggested_filesystem_layout
mount -o --mkdir compress=zstd,subvol=@var_log /dev/$root_partition /mnt/var/log
mount -o --mkdir compress=zstd,subvol=@var_cache /dev/$root_partition /mnt/var/cache
mount -o --mkdir compress=zstd,subvol=@var_tmp /dev/$root_partition /mnt/var/tmp

# Mount subvolumes for snapshots and root filesystem
mount --mkdir -o compress=zstd,subvol=@snapshots /dev/$root_partition /mnt/.snapshots
mount --mkdir /dev/$root_partition /mnt/mnt/btr_pool

# Create swapfile
# https://wiki.archlinux.org/title/Btrfs#Swap_file
if (( swap_size > 0 )); then
	mount --mkdir -o subvol=@swap /dev/$root_partition /mnt/swap
	btrfs filesystem mkswapfile --size "${swap_size}g" --uuid clear /mnt/swap/swapfile
	swapon /mnt/swap/swapfile
fi

# 2 Installation

# 2.2 Install essential packages
pacstrap -K /mnt base linux linux-firmware efibootmgr grub base-devel networkmanager neovim

# 3 Configure the system

# 3.1 Generate fstab file
genfstab -U /mnt >> /mnt/etc/fstab

# 3.2 Change root into the new system
# Insert values into chroot.sh 
uuid_root=$(lsblk -dno UUID /dev/$root_partition)

sed -i -E "s/(^drive=$)/\1'$drive'/" chroot.sh
sed -i -E "s/(^uuid_root=$)/\1'$uuid_root'/" chroot.sh
sed -i -E "s/(^pass_root=$)/\1'$pass_root'/" chroot.sh
sed -i -E "s/(^username=$)/\1'$username'/" chroot.sh
sed -i -E "s/(^pass_user=$)/\1'$pass_user'/" chroot.sh
sed -i -E "s/(^hostname=$)/\1'$hostname'/" chroot.sh
sed -i -E "s/(^keymap=$)/\1'$keymap'/" chroot.sh

cp chroot.sh /mnt/root/chroot.sh
arch-chroot /mnt /root/chroot.sh
shred -u /mnt/root/chroot.sh

# 4 Reboot

# Turn off swap and unmount all partitions.
(( swap_size > 0 )) && swapoff /mnt/swap/swapfile
umount -R /mnt

printf '\033[1mInstallation is done.\n'
