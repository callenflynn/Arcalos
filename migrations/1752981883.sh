echo "Replace wofi with walker as the default launcher"

if arcalos-cmd-missing walker; then
  arcalos-pkg-add walker-bin libqalculate

  arcalos-pkg-drop wofi
  rm -rf ~/.config/wofi

  mkdir -p ~/.config/walker
  cp -r ~/.local/share/arcalos/config/walker/* ~/.config/walker/
fi
