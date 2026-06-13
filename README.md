# Arcalos

Arcalos is a small Arch Linux Hyprland desktop setup. It installs the base desktop packages, installs a few AUR packages with `yay`, and copies the included configs into `~/.config`.

## What is included

- `install.sh` - install script for packages, AUR packages, and config files.
- `packages.txt` - pacman package list.
- `aur.txt` - AUR package list installed with `yay`.
- `docs/UX.md` - Arcalos interaction and visual identity spec.
- `theme/colors.conf` - shared theme color and glass intent source.
- `config/hypr/` - Hyprland config and keybinds.
- `config/rofi/` - Spotlight launcher config and theme.
- `config/waybar/` - Waybar layout and styling.

## Requirements

- Arch Linux or an Arch-based system.
- A user with `sudo` access.
- Network access for pacman and AUR package downloads.

The installer can bootstrap `yay` if it is not already installed.

## Install

From the repo root:

```sh
chmod +x install.sh
./install.sh
```

The script will:

1. Update the system with pacman.
2. Install packages from `packages.txt`.
3. Install `yay` if needed.
4. Install AUR packages from `aur.txt`.
5. Copy `config/*` and `theme/` into `~/.config/`.

After installation, reboot or log out and choose the Hyprland session.

On a fresh Arch install, make sure the core services you want are enabled:

```sh
sudo systemctl enable --now NetworkManager.service
sudo systemctl enable sddm.service
```

## Hyprland Config

The main config is `config/hypr/hyprland.conf`. It contains the session environment, monitor defaults, autostart commands, input settings, appearance, app aliases, and window rules.

Keybinds live in `config/hypr/keybinds.conf`, which is sourced by the main config after the app and modifier aliases are defined.

## Basic Keybinds

- `SUPER + Return` - terminal.
- `SUPER + Space` - Spotlight app launcher.
- `SUPER + Tab` - window switcher.
- `SUPER + B` - browser.
- `SUPER + Q` - close active window.
- `SUPER + F` - fullscreen.
- `SUPER + T` - toggle floating.
- `SUPER + H/J/K/L` - move focus.
- `SUPER + Shift + H/J/K/L` - move window.
- `SUPER + 1-5` - switch workspace.
- `SUPER + Shift + 1-5` - move window to workspace.
- `SUPER + Shift + S` - area screenshot.
- `SUPER + Shift + R` - reload Hyprland.
- `SUPER + Shift + Q` - exit Hyprland.

## Notes

This setup expects `brave` from the `brave-bin` AUR package and `grimblast` from the AUR package list. Waybar uses JetBrains Mono Nerd Font for icons.

The UX direction lives in `docs/UX.md`. Use it as the guide for future shell, bar, launcher, and theme changes.

Theme color decisions live in `theme/colors.conf`. Waybar imports that file directly after install from `~/.config/theme/colors.conf`.
