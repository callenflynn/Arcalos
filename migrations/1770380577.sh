echo "Use interactive background selector menu"

mkdir -p ~/.config/elephant/menus
ln -snf $ARCALOS_PATH/default/elephant/ARCALOS_background_selector.lua ~/.config/elephant/menus/ARCALOS_background_selector.lua
arcalos-restart-walker
