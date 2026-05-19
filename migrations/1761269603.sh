echo "Add right-click terminal action to waybar arcalos menu icon"

WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc"

if [[ -f $WAYBAR_CONFIG ]] && ! grep -A5 '"custom/arcalos"' "$WAYBAR_CONFIG" | grep -q '"on-click-right"'; then
  sed -i '/"on-click": "arcalos-menu",/a\    "on-click-right": "arcalos-launch-terminal",' "$WAYBAR_CONFIG"
fi
