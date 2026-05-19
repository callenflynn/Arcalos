echo "Add minimal starship prompt to terminal"

if arcalos-cmd-missing starship; then
  arcalos-pkg-add starship
  cp $ARCALOS_PATH/config/starship.toml ~/.config/starship.toml
fi
