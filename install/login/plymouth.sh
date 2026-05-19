if [[ $(plymouth-set-default-theme) != "arcalos" ]]; then
  sudo cp -r "$HOME/.local/share/arcalos/default/plymouth" /usr/share/plymouth/themes/arcalos/
  sudo plymouth-set-default-theme arcalos
fi
