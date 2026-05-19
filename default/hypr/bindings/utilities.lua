o.bind_menu("SUPER + SPACE", "arcalos menu", nil)
o.bind("SUPER + CTRL + E", "Emoji picker", { arcalos = "walker -m symbols" })
o.bind_menu("SUPER + CTRL + C", "Capture menu", "capture")
o.bind_menu("SUPER + CTRL + O", "Toggle menu", "toggle")
o.bind_menu("SUPER + CTRL + H", "Hardware menu", "hardware")
o.bind_menu("SUPER + SHIFT + code:201", "arcalos menu", nil)
o.bind_menu("SUPER + ESCAPE", "System menu", "system")
o.bind_menu("XF86PowerOff", "Power menu", "system", { locked = true })
o.bind("SUPER + K", "Show key bindings", "arcalos-menu-keybindings")
o.bind("SUPER + ALT + K", "Show Tmux key bindings", "arcalos-menu-tmux-keybindings")
o.bind("XF86Calculator", "Calculator", "gnome-calculator")

o.bind("SUPER + SHIFT + SPACE", "Toggle top bar", "arcalos-toggle-waybar")
o.bind("SUPER + SHIFT + CTRL + UP", "Move Waybar to top", "arcalos-style-waybar-position top")
o.bind("SUPER + SHIFT + CTRL + DOWN", "Move Waybar to bottom", "arcalos-style-waybar-position bottom")
o.bind("SUPER + SHIFT + CTRL + LEFT", "Move Waybar to left", "arcalos-style-waybar-position left")
o.bind("SUPER + SHIFT + CTRL + RIGHT", "Move Waybar to right", "arcalos-style-waybar-position right")
o.bind_menu("SUPER + CTRL + SPACE", "Background switcher", "background")
o.bind_menu("SUPER + SHIFT + CTRL + SPACE", "Theme menu", "theme")
o.bind("SUPER + BACKSPACE", "Toggle window transparency", "arcalos-hyprland-window-transparency-toggle")
o.bind("SUPER + SHIFT + BACKSPACE", "Toggle window gaps", "arcalos-hyprland-window-gaps-toggle")
o.bind("SUPER + CTRL + BACKSPACE", "Toggle single-window square aspect", "arcalos-hyprland-window-single-square-aspect-toggle")

o.bind("SUPER + COMMA", "Dismiss last notification", "makoctl dismiss")
o.bind("SUPER + SHIFT + COMMA", "Dismiss all notifications", "makoctl dismiss --all")
o.bind("SUPER + CTRL + COMMA", "Toggle silencing notifications", "arcalos-toggle-notification-silencing")
o.bind("SUPER + ALT + COMMA", "Invoke last notification", "makoctl invoke")
o.bind("SUPER + SHIFT + ALT + COMMA", "Restore last notification", "makoctl restore")

o.bind_toggle("SUPER + CTRL + I", "Toggle locking on idle", "idle")
o.bind_toggle("SUPER + CTRL + N", "Toggle nightlight", "nightlight")
o.bind("SUPER + CTRL + Delete", "Toggle laptop display", "arcalos-hyprland-monitor-internal toggle")
o.bind("SUPER + CTRL + ALT + Delete", "Toggle laptop display mirroring", "arcalos-hyprland-monitor-internal-mirror toggle")
o.bind("switch:on:Lid Switch", nil, "arcalos-hw-external-monitors && arcalos-hyprland-monitor-internal off", { locked = true })
o.bind("switch:off:Lid Switch", nil, "arcalos-hyprland-monitor-internal on", { locked = true })

o.bind("PRINT", "Screenshot", "arcalos-capture-screenshot")
o.bind_menu("ALT + PRINT", "Screenrecording", "screenrecord")
o.bind("SUPER + PRINT", "Color picker", "pkill hyprpicker || hyprpicker -a")
o.bind("SUPER + CTRL + PRINT", "Extract text (OCR) from screenshot", "arcalos-capture-text-extraction")

o.bind_menu("SUPER + CTRL + S", "Share", "share")

o.bind("SUPER + CTRL + PERIOD", "Transcode", "arcalos-transcode")

o.bind_menu("SUPER + CTRL + R", "Set reminder", "reminder-set")
o.bind("SUPER + CTRL + ALT + R", "Show reminders", "arcalos-reminder show")
o.bind("SUPER + SHIFT + CTRL + R", "Clear reminders", "arcalos-reminder clear")

o.bind("SUPER + CTRL + ALT + T", "Show time", "arcalos-notification-time")
o.bind("SUPER + CTRL + ALT + B", "Show battery remaining", "arcalos-notification-battery")
o.bind("SUPER + CTRL + ALT + W", "Show weather", "arcalos-notification-weather")

o.bind("SUPER + CTRL + A", "Audio controls", { arcalos = "audio" })
o.bind("SUPER + CTRL + B", "Bluetooth controls", { arcalos = "bluetooth" })
o.bind("SUPER + CTRL + W", "Wifi controls", { arcalos = "wifi" })
o.bind("SUPER + CTRL + T", "Activity", { tui = "btop" })

o.bind("SUPER + CTRL + X", "Toggle dictation", "voxtype record toggle")
o.bind("F9", "Start dictation (push-to-talk)", "voxtype record start")
o.bind("F9", "Stop dictation (push-to-talk)", "voxtype record stop", { release = true })

o.bind("SUPER + CTRL + Z", "Zoom in", function()
  local zoom = hl.get_config("cursor.zoom_factor") or 1
  hl.config({ cursor = { zoom_factor = zoom + 1 } })
end)

o.bind("SUPER + CTRL + ALT + Z", "Reset zoom", function()
  hl.config({ cursor = { zoom_factor = 1 } })
end)

o.bind("SUPER + CTRL + L", "Lock system", "arcalos-system-lock")
