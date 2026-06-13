#!/bin/bash
set -e

echo "=== Arcalos install starting ==="

sudo pacman -Syu --noconfirm

# Install base packages
sudo pacman -S --needed - < packages.txt

# YAY (AUR)
if ! command -v yay &> /dev/null; then
    echo "Installing yay..."
    sudo pacman -S --needed git base-devel --noconfirm
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

# AUR PACKAGES
yay -S --noconfirm - < aur.txt

# CONFIGS
echo "Applying configs..."
mkdir -p ~/.config
cp -r config/* ~/.config/

echo "Done. Reboot or relog into Hyprland."
