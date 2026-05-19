echo "Make ethereal available as new theme"

if [[ ! -L ~/.config/arcalos/themes/ethereal ]]; then
  rm -rf ~/.config/arcalos/themes/ethereal
  ln -nfs ~/.local/share/arcalos/themes/ethereal ~/.config/arcalos/themes/
fi
