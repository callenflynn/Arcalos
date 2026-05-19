echo "Replace volume control GUI with a TUI"

if arcalos-cmd-missing wiremix; then
  arcalos-pkg-add wiremix
  arcalos-pkg-drop pavucontrol
  arcalos-refresh-applications
  arcalos-refresh-waybar
fi
