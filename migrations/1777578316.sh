echo "Rename screen recording command"

WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc"

if [[ -f $WAYBAR_CONFIG ]] && grep -q 'arcalos-capture-screencording' "$WAYBAR_CONFIG"; then
  sed -i 's/arcalos-capture-screencording/arcalos-capture-screenrecording/g' "$WAYBAR_CONFIG"
  arcalos-restart-waybar
fi
