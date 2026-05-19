echo "Install Impala as new wifi selection TUI"

if arcalos-cmd-missing impala; then
  arcalos-pkg-add impala
  arcalos-refresh-waybar
fi
