echo "Ensure all indexes and packages are up to date"

arcalos-update-keyring
arcalos-refresh-pacman
sudo pacman -Syu --noconfirm
