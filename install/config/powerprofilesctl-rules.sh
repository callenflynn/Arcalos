if arcalos-battery-present; then
  cat <<EOF | sudo tee "/etc/udev/rules.d/99-power-profile.rules"
SUBSYSTEM=="power_supply", ATTR{type}=="Mains", RUN+="/usr/bin/systemd-run --no-block --collect --unit=arcalos-power-profile --property=After=power-profiles-daemon.service $HOME/.local/share/arcalos/bin/arcalos-powerprofiles-set"
SUBSYSTEM=="power_supply", ATTR{type}=="USB", RUN+="/usr/bin/systemd-run --no-block --collect --unit=arcalos-power-profile --property=After=power-profiles-daemon.service $HOME/.local/share/arcalos/bin/arcalos-powerprofiles-set"
EOF

  sudo systemctl enable power-profiles-daemon

  sudo udevadm control --reload 2>/dev/null
  sudo udevadm trigger --subsystem-match=power_supply 2>/dev/null
fi
