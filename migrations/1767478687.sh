echo "Add opencode with system theming"

arcalos-pkg-add opencode

# Add config using arcalos theme by default
if [[ ! -f ~/.config/opencode/opencode.json ]]; then
  mkdir -p ~/.config/opencode
  cp $ARCALOS_PATH/config/opencode/opencode.json ~/.config/opencode/opencode.json
fi
