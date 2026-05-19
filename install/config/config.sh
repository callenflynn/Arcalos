# Copy over arcalos configs
mkdir -p ~/.config
cp -R ~/.local/share/arcalos/config/* ~/.config/

# Use default bashrc from arcalos
cp ~/.local/share/arcalos/default/bashrc ~/.bashrc
