#!/bin/bash
set -euo pipefail

echo "=== Arcalos install starting ==="

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

clean_package_list() {
    sed -E 's/[[:space:]]*#.*$//' "$1" | sed '/^[[:space:]]*$/d'
}

clean_package_list "$repo_dir/packages.txt" > "$tmp_dir/packages.txt"
clean_package_list "$repo_dir/aur.txt" > "$tmp_dir/aur.txt"

sudo pacman -Syu --noconfirm

# Install base packages
sudo pacman -S --needed --noconfirm - < "$tmp_dir/packages.txt"

# YAY (AUR)
if ! command -v yay &> /dev/null; then
    echo "Installing yay..."
    sudo pacman -S --needed git base-devel --noconfirm
    git clone https://aur.archlinux.org/yay.git "$tmp_dir/yay"
    cd "$tmp_dir/yay"
    makepkg -si --noconfirm
    cd "$repo_dir"
fi

# AUR PACKAGES
if [ -s "$tmp_dir/aur.txt" ]; then
    yay -S --needed --noconfirm - < "$tmp_dir/aur.txt"
fi

# CONFIGS
echo "Applying configs..."
mkdir -p ~/.config
cp -r "$repo_dir"/config/* ~/.config/
cp -r "$repo_dir"/theme ~/.config/

echo "Done. Reboot or relog into Hyprland."
