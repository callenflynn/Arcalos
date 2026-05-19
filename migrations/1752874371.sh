echo "Add Catppuccin Latte light theme"

if [[ ! -L $HOME/.config/arcalos/themes/catppuccin-latte ]]; then
  ln -snf ~/.local/share/arcalos/themes/catppuccin-latte ~/.config/arcalos/themes/
fi
