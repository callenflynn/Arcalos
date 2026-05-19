echo "Make new Osaka Jade theme available as new default"

if [[ ! -L ~/.config/arcalos/themes/osaka-jade ]]; then
  rm -rf ~/.config/arcalos/themes/osaka-jade
  git -C ~/.local/share/arcalos checkout -f themes/osaka-jade
  ln -nfs ~/.local/share/arcalos/themes/osaka-jade ~/.config/arcalos/themes/osaka-jade
fi
