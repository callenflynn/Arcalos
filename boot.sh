#!/bin/bash

# Set install mode to online since boot.sh is used for curl installations
export ARCALOS_ONLINE_INSTALL=true

ansi_art='                 ▄▄▄
█████╗ ██████╗  ██████╗ █████╗ ██╗      ██████╗ ███████╗
██╔══██╗██╔══██╗██╔════╝██╔══██╗██║     ██╔═══██╗██╔════╝
███████║██████╔╝██║     ███████║██║     ██║   ██║███████╗
██╔══██║██╔══██╗██║     ██╔══██║██║     ██║   ██║╚════██║
██║  ██║██║  ██║╚██████╗██║  ██║███████╗╚██████╔╝███████║
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚══════╝

clear
echo -e "\n$ansi_art\n"

# Use custom branch if instructed, otherwise default to master
ARCALOS_REF="${ARCALOS_REF:-master}"

# Set mirror based on branch
# For now using default Arch mirrors - can be customized with ARCALOS_MIRROR_URL
ARCALOS_MIRROR_URL="${ARCALOS_MIRROR_URL:-}"
if [[ -n $ARCALOS_MIRROR_URL ]]; then
  echo "Server = $ARCALOS_MIRROR_URL" | sudo tee /etc/pacman.d/mirrorlist >/dev/null
fi

sudo pacman -Syu --noconfirm --needed git

# Use custom repo if specified, otherwise default to callenflynn/arcalos
ARCALOS_REPO="${ARCALOS_REPO:-callenflynn/arcalos}"

echo -e "\nCloning Arcalos from: https://github.com/${ARCALOS_REPO}.git"
rm -rf ~/.local/share/arcalos/
git clone "https://github.com/${ARCALOS_REPO}.git" ~/.local/share/arcalos >/dev/null

echo -e "\e[32mUsing branch: $ARCALOS_REF\e[0m"
cd ~/.local/share/arcalos
git fetch origin "${ARCALOS_REF}" && git checkout "${ARCALOS_REF}"
cd -

echo -e "\nInstallation starting..."
source ~/.local/share/arcalos/install.sh
