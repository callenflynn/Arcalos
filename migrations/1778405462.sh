echo "Create Mako and Walker toggle configs"

mkdir -p ~/.local/state/arcalos/toggles
[[ -f ~/.local/state/arcalos/toggles/mako.ini ]] || touch ~/.local/state/arcalos/toggles/mako.ini
[[ -f ~/.local/state/arcalos/toggles/walker.css ]] || touch ~/.local/state/arcalos/toggles/walker.css
