echo "Add Tmux as an option with themed styling"

arcalos-pkg-add tmux

if [[ ! -f ~/.config/tmux/tmux.conf ]]; then
  mkdir -p ~/.config/tmux
  cp $ARCALOS_PATH/config/tmux/tmux.conf ~/.config/tmux/tmux.conf
  arcalos-theme-refresh
fi
