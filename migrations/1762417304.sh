echo "Replace bluetooth GUI with TUI"

arcalos-pkg-add bluetui
arcalos-pkg-drop blueberry

if ! grep -q "arcalos-launch-bluetooth" ~/.config/waybar/config.jsonc; then
  sed -i 's/blueberry/arcalos-launch-bluetooth/' ~/.config/waybar/config.jsonc
fi
