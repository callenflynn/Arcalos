# Arcalos Dev Rules

You are working inside the Arcalos project.

## Goal
Build a reproducible Hyprland-based desktop environment with:
- Hyprland WM
- Waybar shell-style UI
- Rofi launcher (Spotlight replacement)
- clean installable Arch setup via scripts

## Principles
- Keep configs minimal, readable, and modular
- Avoid unnecessary abstraction
- Prefer standard Linux tools over custom frameworks
- No DMS dependency
- Ensure everything is reproducible on fresh Arch install

## Structure rules
- packages/ = install lists
- config/ = user configs
- docs/ = system design + UX specs
- install.sh = single entry bootstrap

## UX target
- SUPER key is primary system control
- Spotlight-like launcher via rofi
- macOS-inspired clean shell aesthetic
- Waybar acts as system header bar

## Output style
- Prefer complete file edits
- Avoid partial snippets unless requested
- Keep changes minimal and functional