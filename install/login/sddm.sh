# Install arcalos SDDM theme
arcalos-refresh-sddm

# Setup SDDM login service
sudo mkdir -p /usr/local/share/wayland-sessions
sudo cp "$ARCALOS_PATH/default/wayland-sessions/arcalos.desktop" /usr/local/share/wayland-sessions/arcalos.desktop
sudo cp "$ARCALOS_PATH/default/sddm/hyprland.lua" /usr/share/sddm/hyprland.lua
sudo rm -f /usr/share/sddm/hyprland.conf

sudo mkdir -p /etc/sddm.conf.d
cat <<EOF | sudo tee /etc/sddm.conf.d/10-wayland.conf >/dev/null
[General]
DisplayServer=wayland

[Wayland]
CompositorCommand=start-hyprland -- --config /usr/share/sddm/hyprland.lua
EOF

if [[ ! -f /etc/sddm.conf.d/autologin.conf ]]; then
  cat <<EOF | sudo tee /etc/sddm.conf.d/autologin.conf
[Autologin]
User=$USER
Session=arcalos

[Theme]
Current=arcalos
EOF
else
  sudo sed -i 's/^Session=hyprland-uwsm$/Session=arcalos/' /etc/sddm.conf.d/autologin.conf
fi

# Prevent password-based SDDM logins from creating an encrypted login keyring
# (which conflicts with the passwordless Default_keyring used for auto-unlock)
sudo sed -i '/-auth.*pam_gnome_keyring\.so/d' /etc/pam.d/sddm
sudo sed -i '/-password.*pam_gnome_keyring\.so/d' /etc/pam.d/sddm

# Don't use chrootable here as --now will cause issues for manual installs
sudo systemctl enable sddm.service
