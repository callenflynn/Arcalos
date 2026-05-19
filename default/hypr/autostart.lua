o.launch_on_start("hypridle")
o.launch_on_start("mako")
o.exec_on_start("! arcalos-toggle-enabled waybar-off && " .. o.launch("waybar"))
o.launch_on_start("fcitx5 --disable notificationitem")
o.launch_on_start("swaybg -i ~/.config/arcalos/current/background -m fill")
o.exec_on_start("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
o.exec_on_start("arcalos-first-run")
o.exec_on_start("arcalos-powerprofiles-init")
o.launch_on_start("arcalos-hyprland-monitor-watch")

-- Slow app launch fix -- set systemd vars.
o.exec_on_start("systemctl --user import-environment $(env | cut -d'=' -f 1)")
o.exec_on_start("dbus-update-activation-environment --systemd --all")

-- Run post-boot hooks after startup config has loaded.
o.exec_on_start("sleep 2 && arcalos-hook post-boot")
