echo "Switch lmstudio -> lmstudio-bin"

if pacman -Q lmstudio &>/dev/null; then
  arcalos-pkg-drop lmstudio
  arcalos-pkg-add lmstudio-bin
fi
