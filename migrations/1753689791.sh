echo "Add the new ristretto theme as an option"

if [[ ! -L ~/.config/arcalos/themes/ristretto ]]; then
  ln -nfs ~/.local/share/arcalos/themes/ristretto ~/.config/arcalos/themes/
fi
