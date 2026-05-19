echo "Show battery status notification on right-click of the waybar battery icon"

if ! grep -q 'arcalos-battery-status' ~/.config/waybar/config.jsonc; then
  sed -i '/"on-click": "arcalos-menu power",/a\    "on-click-right": "notify-send -u low \\"$(arcalos-battery-status)\\"",' ~/.config/waybar/config.jsonc
  arcalos-restart-waybar
fi
