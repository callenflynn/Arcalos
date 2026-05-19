echo "Fix display backlight on supported ASUS Panther Lake laptops"

EXPERTBOOK_DROP_IN="/etc/limine-entry-tool.d/asus-expertbook-b9406-display.conf"

if arcalos-hw-asus-expertbook-b9406 || arcalos-hw-asus-zenbook-ux5406aa; then
  if [[ -f $EXPERTBOOK_DROP_IN ]]; then
    sudo sed -i '/xe\.enable_dpcd_backlight/d' "$EXPERTBOOK_DROP_IN"
  fi

  source "$ARCALOS_PATH/install/config/hardware/asus/fix-asus-ptl-display-backlight.sh"

  if arcalos-cmd-present limine-update; then
    sudo limine-update
  fi
fi
