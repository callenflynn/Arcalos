echo "Use arcalos UWSM session without graphical.target startup wait"

sudo mkdir -p /usr/local/share/wayland-sessions
sudo cp "$ARCALOS_PATH/default/wayland-sessions/arcalos.desktop" /usr/local/share/wayland-sessions/arcalos.desktop

if [[ -f /etc/sddm.conf.d/autologin.conf ]]; then
  sudo sed -i 's/^Session=hyprland-uwsm$/Session=arcalos/' /etc/sddm.conf.d/autologin.conf
fi
