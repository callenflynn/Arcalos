echo "Add new matte black theme"

if [[ ! -L $HOME/.config/arcalos/themes/matte-black ]]; then
  ln -snf ~/.local/share/arcalos/themes/matte-black ~/.config/arcalos/themes/
fi
