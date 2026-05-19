require("default.hypr.bindings.media")
require("default.hypr.bindings.clipboard")
require("default.hypr.bindings.tiling-v2")
require("default.hypr.bindings.utilities")

-- Application bindings without arcalos's preinstalled web apps, TUIs, or desktop apps.
o.bind("SUPER + Q", "Terminal", { arcalos = "terminal" })
o.bind("SUPER + SHIFT + RETURN", "Browser", { arcalos = "browser" })
o.bind("SUPER + SHIFT + F", "File manager", { arcalos = "nautilus" })
o.bind("SUPER + ALT + SHIFT + F", "File manager (cwd)", { arcalos = "nautilus-cwd" })
o.bind("SUPER + SHIFT + B", "Browser", { arcalos = "browser" })
o.bind("SUPER + SHIFT + ALT + B", "Browser (private)", { arcalos = "browser --private" })
o.bind("SUPER + SHIFT + N", "Editor", { arcalos = "editor" })
