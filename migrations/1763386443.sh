echo "Uniquely identify terminal apps with custom app-ids using arcalos-launch-tui"

# Replace terminal -e calls with arcalos-launch-tui in bindings
sed -i 's/\$terminal -e \([^ ]*\)/arcalos-launch-tui \1/g' ~/.config/hypr/bindings.conf

# Update waybar to use arcalos-launch-or-focus with arcalos-launch-tui for TUI apps
sed -i 's|xdg-terminal-exec btop|arcalos-launch-or-focus-tui btop|' ~/.config/waybar/config.jsonc
sed -i 's|xdg-terminal-exec --app-id=com\.arcalos\.Wiremix -e wiremix|arcalos-launch-or-focus-tui wiremix|' ~/.config/waybar/config.jsonc
