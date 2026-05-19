-- Volume, brightness, keyboard backlight, and touchpad controls.
o.bind("XF86AudioRaiseVolume", "Volume up", "arcalos-swayosd-client --output-volume raise", { locked = true, repeating = true })
o.bind("XF86AudioLowerVolume", "Volume down", "arcalos-swayosd-client --output-volume lower", { locked = true, repeating = true })
o.bind("XF86AudioMute", "Mute", "arcalos-swayosd-client --output-volume mute-toggle", { locked = true, repeating = true })
o.bind("XF86AudioMicMute", "Mute microphone", "arcalos-audio-input-mute", { locked = true, repeating = true })
o.bind("XF86MonBrightnessUp", "Brightness up", "arcalos-brightness-display +5%", { locked = true, repeating = true })
o.bind("XF86MonBrightnessDown", "Brightness down", "arcalos-brightness-display 5%-", { locked = true, repeating = true })
o.bind("SHIFT + XF86MonBrightnessUp", "Brightness maximum", "arcalos-brightness-display 100%", { locked = true, repeating = true })
o.bind("SHIFT + XF86MonBrightnessDown", "Brightness minimum", "arcalos-brightness-display 1%", { locked = true, repeating = true })
o.bind("XF86KbdBrightnessUp", "Keyboard brightness up", "arcalos-brightness-keyboard up", { locked = true, repeating = true })
o.bind("XF86KbdBrightnessDown", "Keyboard brightness down", "arcalos-brightness-keyboard down", { locked = true, repeating = true })
o.bind("XF86KbdLightOnOff", "Keyboard backlight cycle", "arcalos-brightness-keyboard cycle", { locked = true })
o.bind("XF86TouchpadToggle", "Toggle touchpad", "arcalos-toggle-touchpad", { locked = true })
o.bind("XF86TouchpadOn", "Enable touchpad", "arcalos-toggle-touchpad on", { locked = true })
o.bind("XF86TouchpadOff", "Disable touchpad", "arcalos-toggle-touchpad off", { locked = true })

-- Precise volume and brightness controls.
o.bind("ALT + XF86AudioRaiseVolume", "Volume up precise", "arcalos-swayosd-client --output-volume +1", { locked = true, repeating = true })
o.bind("ALT + XF86AudioLowerVolume", "Volume down precise", "arcalos-swayosd-client --output-volume -1", { locked = true, repeating = true })
o.bind("ALT + XF86MonBrightnessUp", "Brightness up precise", "arcalos-brightness-display +1%", { locked = true, repeating = true })
o.bind("ALT + XF86MonBrightnessDown", "Brightness down precise", "arcalos-brightness-display 1%-", { locked = true, repeating = true })

-- Media controls.
o.bind("XF86AudioNext", "Next track", "arcalos-swayosd-client --playerctl next", { locked = true })
o.bind("XF86AudioPause", "Pause", "arcalos-swayosd-client --playerctl play-pause", { locked = true })
o.bind("XF86AudioPlay", "Play", "arcalos-swayosd-client --playerctl play-pause", { locked = true })
o.bind("XF86AudioPrev", "Previous track", "arcalos-swayosd-client --playerctl previous", { locked = true })

o.bind("SUPER + XF86AudioMute", "Switch audio output", "arcalos-audio-output-switch", { locked = true })
