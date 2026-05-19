echo "Allow updating of timezone by right-clicking on the clock (or running arcalos-cmd-tzupdate)"

if arcalos-cmd-missing tzupdate; then
  bash "$ARCALOS_PATH/install/config/timezones.sh"
  arcalos-refresh-waybar
fi
