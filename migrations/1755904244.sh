echo "Update fastfetch config with new arcalos logo"

arcalos-refresh-config fastfetch/config.jsonc

mkdir -p ~/.config/arcalos/branding
cp $ARCALOS_PATH/icon.txt ~/.config/arcalos/branding/about.txt
