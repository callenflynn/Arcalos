abort() {
  echo -e "\e[31mArcalos install requires: $1\e[0m"
  echo
  gum confirm "Proceed anyway on your own accord and without assistance?" || exit 1
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
    printf '%s\n' "$pacman_fallback" | sudo tee "$pacman_conf" >/dev/null || abort "pacman.conf"
  fi

  if [[ -f $pacman_conf && ! -r $pacman_conf ]]; then
    sudo chmod 644 "$pacman_conf" || abort "pacman.conf permissions"
  fi
}

ensure_pacman_config_readable() {
  local pacman_conf="/etc/pacman.conf"
  local mirrorlist="/etc/pacman.d/mirrorlist"
  local chaotic_mirrorlist="/etc/pacman.d/chaotic-mirrorlist"
  local mirrorlist_fallback='Server = https://geo.mirror.pkgbuild.com/$repo/os/$arch
Server = https://mirrors.kernel.org/archlinux/$repo/os/$arch
Server = https://mirror.rackspace.com/archlinux/$repo/os/$arch'
  local chaotic_fallback='Server = https://cdn-mirror.chaotic.cx/$repo/$arch'

  if [[ -f $pacman_conf && ! -r $pacman_conf ]]; then
    sudo chmod 644 "$pacman_conf" || abort "pacman.conf permissions"
  fi

  if [[ ! -f $mirrorlist ]]; then
    sudo mkdir -p /etc/pacman.d
    printf '%s\n' "$mirrorlist_fallback" | sudo tee "$mirrorlist" >/dev/null || abort "pacman mirrorlist"
  elif ! grep -q "^[[:space:]]*Server[[:space:]]*=" "$mirrorlist"; then
    printf '%s\n' "$mirrorlist_fallback" | sudo tee "$mirrorlist" >/dev/null || abort "pacman mirrorlist"
  fi

  if [[ -f $mirrorlist && ! -r $mirrorlist ]]; then
    sudo chmod 644 "$mirrorlist" || abort "pacman mirrorlist permissions"
  fi

  if [[ -f $pacman_conf ]] && grep -q "chaotic-mirrorlist" "$pacman_conf"; then
    if [[ ! -f $chaotic_mirrorlist ]]; then
      sudo mkdir -p /etc/pacman.d
      printf '%s\n' "$chaotic_fallback" | sudo tee "$chaotic_mirrorlist" >/dev/null || abort "chaotic mirrorlist"
    elif ! grep -q "^[[:space:]]*Server[[:space:]]*=" "$chaotic_mirrorlist"; then
      printf '%s\n' "$chaotic_fallback" | sudo tee "$chaotic_mirrorlist" >/dev/null || abort "chaotic mirrorlist"
    fi

    if [[ ! -r $chaotic_mirrorlist ]]; then
      sudo chmod 644 "$chaotic_mirrorlist" || abort "chaotic mirrorlist permissions"
    fi
  fi
}

abort_required_package() {
  local pkg="$1"
  echo -e "\e[31mArcalos install requires package: $pkg\e[0m"
  exit 1
}

install_required_package() {
  local pkg="$1"

  if ! pacman -Q "$pkg" &>/dev/null; then
    echo "Installing required package: $pkg"
    sudo pacman -S --noconfirm --needed "$pkg" || abort_required_package "$pkg"
  fi
}

# Must be an Arch distro
if [[ ! -f /etc/arch-release ]]; then
  abort "Vanilla Arch"
fi

# Must not be an Arch derivative distro
for marker in /etc/cachyos-release /etc/eos-release /etc/garuda-release /etc/manjaro-release; do
  if [[ -f $marker ]]; then
    abort "Vanilla Arch"
  fi
done

# Must not be running as root
if (( EUID == 0 )); then
  abort "Running as root (not user)"
fi

# Must be x86 only to fully work
if [[ $(uname -m) != "x86_64" ]]; then
  abort "x86_64 CPU"
fi

# Must have secure boot disabled
if bootctl status 2>/dev/null | grep -q 'Secure Boot: enabled'; then
  abort "Secure Boot disabled"
fi

# Ensure pacman config is valid before any pacman queries
ensure_pacman_config_valid
ensure_pacman_config_readable

# Must not have Gnome or KDE already install
if sudo pacman -Qe gnome-shell &>/dev/null || sudo pacman -Qe plasma-desktop &>/dev/null; then
  abort "Fresh + Vanilla Arch"
fi

# Must have limine installed
install_required_package limine
command -v limine &>/dev/null || abort_required_package limine

# Ensure btrfs tooling is present for later steps
install_required_package btrfs-progs

# Must have btrfs root filesystem
[[ $(findmnt -n -o FSTYPE /) = "btrfs" ]] || abort "Btrfs root filesystem" 

# Cleared all guards
echo "Guards: OK"
