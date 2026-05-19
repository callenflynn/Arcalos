echo "Move arcalos Package Repository after Arch core/extra/multilib and remove AUR"

arcalos-refresh-pacman
sudo pacman -Syu --noconfirm
