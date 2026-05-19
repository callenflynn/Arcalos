echo "Use interactive unlock (Plymouth) selector menu"

mkdir -p ~/.config/elephant/menus
ln -snf $ARCALOS_PATH/default/elephant/ARCALOS_unlocks.lua ~/.config/elephant/menus/ARCALOS_unlocks.lua
arcalos-restart-walker
