echo "Use explicit timezone selector when right-clicking on clock"

sed -i 's/arcalos-cmd-tzupdate/arcalos-launch-floating-terminal-with-presentation arcalos-tz-select/g' ~/.config/waybar/config.jsonc
