#!/bin/bash
# Script to run inside chroot environment.

# Values are set by "arch.sh". Do not edit yourself!
drive=
uuid_root=
pass_root=
username=
pass_user=
hostname=
keymap=

# 3.3 Time
ln -sf /usr/share/zoneinfo/Europe/Vienna /etc/localtime
hwclock --systohc

# 3.4 Localization
sed -i -E 's/^#(en_US.UTF-8 UTF-8\s*$)/\1/' /etc/locale.gen
sed -i -E 's/^#(en_GB.UTF-8 UTF-8\s*$)/\1/' /etc/locale.gen
sed -i -E 's/^#(de_AT.UTF-8 UTF-8\s*$)/\1/' /etc/locale.gen
locale-gen
printf 'LANG=en_US.UTF-8\n' > /etc/locale.conf
printf 'KEYMAP=%s\n' $keymap > /etc/vconsole.conf

# 3.5 Network configuration
printf '%s\n' $hostname > /etc/hostname
printf '127.0.0.1 localhost\n::1 localhost\n127.0.1.1 %s\n' $hostname > /etc/hosts

systemctl enable NetworkManager.service

# 3.7 Root password
printf 'root:%s' $pass_root | chpasswd

# Add user
useradd -m -G wheel $username
printf '%s:%s' $username $pass_user | chpasswd
sed -i -E 's/^#\s*(%wheel ALL=\(ALL:ALL\) ALL$)/\1/' /etc/sudoers

# 3.8 Boot loader
# Install microcode updates, cf.
# https://wiki.archlinux.org/title/Installation_guide#Install_essential_packages
case $(lscpu | grep 'Vendor ID') in
    *AuthenticAMD*)
        microcode=amd-ucode
        ;;
    *GenuineIntel*)
        microcode=intel-ucode
        ;;
    *)
        printf 'Could not find microcode for processor. Aborting script.\n'
        exit 1
        ;;
esac

pacman -S --noconfirm $microcode

# https://wiki.archlinux.org/title/GRUB#Installation
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB

# https://wiki.archlinux.org/title/GRUB#Generate_the_main_configuration_file
grub-mkconfig -o /boot/grub/grub.cfg
