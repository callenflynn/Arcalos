echo "Install swayOSD to show volume status"

if arcalos-cmd-missing swayosd-server; then
  arcalos-pkg-add swayosd
  setsid uwsm-app -- swayosd-server &>/dev/null &
fi
