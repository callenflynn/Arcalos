echo "Add sample low battery notification hook"

mkdir -p ~/.config/arcalos/hooks/battery-low.d

if [[ ! -f ~/.config/arcalos/hooks/battery-low.d/play-warning-sound.sample ]]; then
  cp "$ARCALOS_PATH/config/arcalos/hooks/battery-low.d/play-warning-sound.sample" ~/.config/arcalos/hooks/battery-low.d/play-warning-sound.sample
fi
