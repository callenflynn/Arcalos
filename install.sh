#!/bin/bash
set -e

echo "=== Arcalos install starting ==="

sudo pacman -Syu --noconfirm
sudo pacman -S --needed - < packages.txt

echo "Copying configs..."
mkdir -p ~/.config
cp -r config/* ~/.config/

echo "Done."
echo "Log out and select Hyprland session."
