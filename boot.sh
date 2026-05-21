#!/bin/bash

# Set install mode to online since boot.sh is used for curl installations
export ARCALOS_ONLINE_INSTALL=true

ansi_art=$(cat << 'EOF'
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

ensure_pacman_include_files() {
  local pacman_conf="/etc/pacman.conf"
  local chaotic_mirrorlist="/etc/pacman.d/chaotic-mirrorlist"
  local chaotic_fallback='Server = https://cdn-mirror.chaotic.cx/$repo/$arch'

  if [[ -f $pacman_conf ]] && grep -q "chaotic-mirrorlist" "$pacman_conf"; then
    if [[ ! -f $chaotic_mirrorlist ]]; then
      sudo mkdir -p /etc/pacman.d
      printf '%s\n' "$chaotic_fallback" | sudo tee "$chaotic_mirrorlist" >/dev/null
    fi

    if [[ -f $chaotic_mirrorlist ]] && ! grep -q "^[[:space:]]*Server[[:space:]]*=" "$chaotic_mirrorlist"; then
      printf '%s\n' "$chaotic_fallback" | sudo tee "$chaotic_mirrorlist" >/dev/null
    elif [[ -f $chaotic_mirrorlist ]] && ! grep -q "cdn-mirror\.chaotic\.cx/\$repo/\$arch" "$chaotic_mirrorlist"; then
      printf '%s\n' "$chaotic_fallback" | sudo tee "$chaotic_mirrorlist" >/dev/null
    fi

    if [[ ! -r $chaotic_mirrorlist ]]; then
      sudo chmod 644 "$chaotic_mirrorlist"
    fi
  fi
}

ensure_pacman_config_valid() {
  local pacman_conf="/etc/pacman.conf"
  local pacman_fallback='[options]
Color
ILoveCandy
VerbosePkgLists
HoldPkg = pacman glibc
Architecture = auto
CheckSpace
ParallelDownloads = 5

SigLevel = Required DatabaseOptional
LocalFileSigLevel = Optional

[core]
Include = /etc/pacman.d/mirrorlist

[extra]
Include = /etc/pacman.d/mirrorlist

[multilib]
Include = /etc/pacman.d/mirrorlist'
  local needs_reset="false"

  if [[ ! -f $pacman_conf ]]; then
    needs_reset="true"
  elif [[ ! -r $pacman_conf ]]; then
    needs_reset="true"
  elif ! grep -q "^\[core\]" "$pacman_conf"; then
    needs_reset="true"
  elif ! grep -q "Include = /etc/pacman.d/mirrorlist" "$pacman_conf"; then
    needs_reset="true"
  fi

  if [[ $needs_reset == "true" ]]; then
    printf '%s\n' "$pacman_fallback" | sudo tee "$pacman_conf" >/dev/null || exit 1
  fi

  if [[ -f $pacman_conf && ! -r $pacman_conf ]]; then
    sudo chmod 644 "$pacman_conf"
  fi
}

ensure_pacman_config_permissions() {
  local pacman_conf="/etc/pacman.conf"

  if [[ -f $pacman_conf && ! -r $pacman_conf ]]; then
    sudo chmod 644 "$pacman_conf"
  fi
}

ensure_pacman_mirrorlist() {
  local mirrorlist="/etc/pacman.d/mirrorlist"
  local mirrorlist_fallback='Server = https://geo.mirror.pkgbuild.com/$repo/os/$arch
Server = https://mirrors.kernel.org/archlinux/$repo/os/$arch
Server = https://mirror.rackspace.com/archlinux/$repo/os/$arch'

  if [[ ! -f $mirrorlist ]]; then
    sudo mkdir -p /etc/pacman.d
    printf '%s\n' "$mirrorlist_fallback" | sudo tee "$mirrorlist" >/dev/null
  elif ! grep -q "^[[:space:]]*Server[[:space:]]*=" "$mirrorlist"; then
    printf '%s\n' "$mirrorlist_fallback" | sudo tee "$mirrorlist" >/dev/null
  fi

  if [[ ! -r $mirrorlist ]]; then
    sudo chmod 644 "$mirrorlist"
  fi
}

ensure_pacman_keyring() {
  if ! sudo pacman-key --list-keys >/dev/null 2>&1; then
    sudo pacman-key --init
    sudo pacman-key --populate archlinux
  fi
}

# Use standard Arch mirrors
ensure_pacman_config_valid
ensure_pacman_config_permissions
ensure_pacman_mirrorlist
ensure_pacman_include_files
ensure_pacman_keyring
sudo pacman -Sy --noconfirm reflector rsync
sudo reflector --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

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
