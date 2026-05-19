#!/bin/bash

# Set install mode to online since boot.sh is used for curl installations
export ARCALOS_ONLINE_INSTALL=true

ansi_art=$(cat << 'EOF'
                 ▄▄▄
█████╗ ██████╗  ██████╗ █████╗ ██╗      ██████╗ ███████╗
██╔══██╗██╔══██╗██╔════╝██╔══██╗██║     ██╔═══██╗██╔════╝
███████║██████╔╝██║     ███████║██║     ██║   ██║███████╗
██╔══██║██╔══██╗██║     ██╔══██║██║     ██║   ██║╚════██║
██║  ██║██║  ██║╚██████╗██║  ██║███████╗╚██████╔╝███████║
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚══════╝
EOF
)
clear
echo -e "\n$ansi_art\n"

# Use custom branch if instructed, otherwise default to master
ARCALOS_REF="${ARCALOS_REF:-master}"

# Set mirror and release track based on branch
if [[ $ARCALOS_REF == "dev" ]]; then
  export ARCALOS_MIRROR=edge
elif [[ $ARCALOS_REF == "rc" ]]; then
  export ARCALOS_MIRROR=rc
else
  export ARCALOS_MIRROR=stable
fi

# Use standard Arch mirrors
sudo pacman -Sy --noconfirm reflector
sudo reflector --latest 10 --sort rate --save /etc/pacman.d/mirrorlist

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
