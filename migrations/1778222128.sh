echo "Add sample post-boot hook"

mkdir -p ~/.config/arcalos/hooks/post-boot.d

if [[ ! -f ~/.config/arcalos/hooks/post-boot.d/weather.sample ]]; then
  cp "$ARCALOS_PATH/config/arcalos/hooks/post-boot.d/weather.sample" ~/.config/arcalos/hooks/post-boot.d/weather.sample
fi
