echo "Turn off fcitx5 clipboard that is interferring with other applications"

mkdir -p ~/.config/fcitx5/conf
cp $ARCALOS_PATH/config/fcitx5/conf/clipboard.conf ~/.config/fcitx5/conf/

arcalos-restart-xcompose
