if [[ -n ${ARCALOS_ONLINE_INSTALL:-} ]]; then
  ensure_pacman_bootstrap() {
    local pacman_conf="/etc/pacman.conf"
    local mirrorlist="/etc/pacman.d/mirrorlist"
    local chaotic_mirrorlist="/etc/pacman.d/chaotic-mirrorlist"
    local mirrorlist_fallback='Server = https://geo.mirror.pkgbuild.com/$repo/os/$arch
Server = https://mirrors.kernel.org/archlinux/$repo/os/$arch
Server = https://mirror.rackspace.com/archlinux/$repo/os/$arch'
    local chaotic_fallback='Server = https://geo-mirror.chaotic.cx/$repo/$arch'

    if [[ -f $pacman_conf && ! -r $pacman_conf ]]; then
      sudo chmod 644 "$pacman_conf"
    fi

    if [[ ! -f $mirrorlist ]]; then
      sudo mkdir -p /etc/pacman.d
      printf '%s\n' "$mirrorlist_fallback" | sudo tee "$mirrorlist" >/dev/null
    elif ! grep -q "^[[:space:]]*Server[[:space:]]*=" "$mirrorlist"; then
      printf '%s\n' "$mirrorlist_fallback" | sudo tee "$mirrorlist" >/dev/null
    fi

    if [[ -f $mirrorlist && ! -r $mirrorlist ]]; then
      sudo chmod 644 "$mirrorlist"
    fi

    if [[ -f $pacman_conf ]] && grep -q "chaotic-mirrorlist" "$pacman_conf"; then
      if [[ ! -f $chaotic_mirrorlist ]]; then
        sudo mkdir -p /etc/pacman.d
        printf '%s\n' "$chaotic_fallback" | sudo tee "$chaotic_mirrorlist" >/dev/null
      elif ! grep -q "^[[:space:]]*Server[[:space:]]*=" "$chaotic_mirrorlist"; then
        printf '%s\n' "$chaotic_fallback" | sudo tee "$chaotic_mirrorlist" >/dev/null
      elif ! grep -Eq "(cdn|geo)-mirror\.chaotic\.cx/\$repo/\$arch" "$chaotic_mirrorlist"; then
        printf '%s\n' "$chaotic_fallback" | sudo tee "$chaotic_mirrorlist" >/dev/null
      fi

      if [[ ! -r $chaotic_mirrorlist ]]; then
        sudo chmod 644 "$chaotic_mirrorlist"
      fi
    fi
  }

  ensure_pacman_keyring() {
    if ! sudo pacman-key --list-keys >/dev/null 2>&1; then
      sudo pacman-key --init
      sudo pacman-key --populate archlinux
    fi
  }

  ensure_pacman_bootstrap
  ensure_pacman_keyring

  # Configure pacman
  sudo cp -f ~/.local/share/arcalos/default/pacman/pacman-${ARCALOS_MIRROR:-stable}.conf /etc/pacman.conf
  sudo cp -f ~/.local/share/arcalos/default/pacman/mirrorlist-${ARCALOS_MIRROR:-stable} /etc/pacman.d/mirrorlist
  ensure_pacman_bootstrap

  # Install build tools
  arcalos-pkg-add base-devel

  # Trust Chaotic-AUR key
  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB

  # Install Chaotic-AUR keyring and mirrorlist
  sudo pacman -U --noconfirm \
    'https://geo-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' \
    'https://geo-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

  ensure_pacman_bootstrap

  # Trust Arcalos keyring (if using custom repo)
  sudo pacman-key --recv-keys 40DFB630FF42BCFFB047046CF0134EE680CAC571 --keyserver keys.openpgp.org
  sudo pacman-key --lsign-key 40DFB630FF42BCFFB047046CF0134EE680CAC571

  sudo pacman -Sy
  arcalos-pkg-add arcalos-keyring

  # Refresh all repos
  sudo pacman -Syyuu --noconfirm
fi
