echo "Make hackerman available as new theme"

if [[ ! -L ~/.config/arcalos/themes/hackerman ]]; then
  rm -rf ~/.config/arcalos/themes/hackerman
  ln -nfs ~/.local/share/arcalos/themes/hackerman ~/.config/arcalos/themes/
fi
