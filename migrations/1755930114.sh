echo "Add new arcalos Menu icon to Waybar"

mkdir -p ~/.local/share/fonts
cp ~/.local/share/arcalos/config/arcalos.ttf ~/.local/share/fonts/
fc-cache
