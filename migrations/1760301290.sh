echo "Add the new Flexoki Light theme"

if [[ ! -L ~/.config/arcalos/themes/flexoki-light ]]; then
  ln -nfs ~/.local/share/arcalos/themes/flexoki-light ~/.config/arcalos/themes/
fi
