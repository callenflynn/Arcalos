echo "Install socat so we can reactivate internal display when external display is removed"

arcalos-pkg-add socat
uwsm-app -- arcalos-hyprland-monitor-watch &
