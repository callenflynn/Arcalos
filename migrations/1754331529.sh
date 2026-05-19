echo "Update Waybar for new arcalos menu"

if ! grep -q "" ~/.config/waybar/config.jsonc; then
  arcalos-refresh-waybar
fi
