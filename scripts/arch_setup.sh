#!/bin/bash

# Install packages
sudo pacman -Syu
sudo pacman -S --needed - < packages.txt

# systemd
sudo timedatectl set-ntp true

# Create directories
mkdir -p ~/.config
mkdir -p ~/.local/share
mkdir -p ~/.local/state
mkdir -p ~/.cache
mkdir -p ~/.ssh

# Set permissions
chmod 700 ~/.ssh

# Why does "~" instead of "$HOME" cause errors in stow command?
stow home --dir="$HOME/.dotfiles" --target="$HOME" home

systemctl enable --user ssh-agent.service
systemctl enable --user --now hypridle.service

# Finalize
printf '\033[1mCustom installation is done. Please reboot.\n'
