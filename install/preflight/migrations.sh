ARCALOS_MIGRATIONS_STATE_PATH=~/.local/state/arcalos/migrations
mkdir -p $ARCALOS_MIGRATIONS_STATE_PATH

for file in ~/.local/share/arcalos/migrations/*.sh; do
  touch "$ARCALOS_MIGRATIONS_STATE_PATH/$(basename "$file")"
done
