echo "Refresh Waybar config and style for position support"

if gum confirm "Replace current Waybar config and style (backups will be made)?"; then
  arcalos-refresh-waybar
fi
