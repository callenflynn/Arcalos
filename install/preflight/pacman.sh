if [[ -n ${ARCALOS_ONLINE_INSTALL:-} ]]; then
  # Install build tools
  arcalos-pkg-add base-devel

  # Configure pacman
  sudo cp -f ~/.local/share/arcalos/default/pacman/pacman-${ARCALOS_MIRROR:-stable}.conf /etc/pacman.conf
  sudo cp -f ~/.local/share/arcalos/default/pacman/mirrorlist-${ARCALOS_MIRROR:-stable} /etc/pacman.d/mirrorlist

  # Trust Chaotic-AUR key
  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB

  # Install Chaotic-AUR keyring and mirrorlist
  sudo pacman -U --noconfirm \
    'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' \
    'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

  # Trust Arcalos keyring (if using custom repo)
  sudo pacman-key --recv-keys 40DFB630FF42BCFFB047046CF0134EE680CAC571 --keyserver keys.openpgp.org
  sudo pacman-key --lsign-key 40DFB630FF42BCFFB047046CF0134EE680CAC571

  sudo pacman -Sy
  arcalos-pkg-add arcalos-keyring

  # Refresh all repos
  sudo pacman -Syyuu --noconfirm
fi
