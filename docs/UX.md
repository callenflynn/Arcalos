# Arcalos UX

This file defines the current Arcalos desktop identity. Treat it as the source of truth when changing Hyprland, Waybar, launchers, and related system UI.

If a config change conflicts with this file, the config is wrong. Update this file first only when the intended identity changes.

## System Position

Arcalos is a functional Hyprland desktop distribution prototype. It should feel like a small operating system with a clear identity, not a loose config pack.

The current target is:

- fast to understand
- minimal without feeling empty
- glassy, structured, and calm
- keyboard-first
- consistent across shell, bar, launcher, and system controls

## Interaction Model

`SUPER` is the system key.

Primary actions:

- `SUPER + Space` opens Spotlight.
- `SUPER + Return` opens the terminal.
- `SUPER + Tab` switches windows.
- `SUPER + 1-5` moves through workspaces.
- `SUPER + Shift + 1-5` sends windows to workspaces.

Spotlight is the official launcher identity. It is currently implemented with `rofi -show drun`.

Avoid duplicate bindings for the same primary concept. Secondary bindings are allowed only when they represent a distinct workflow.

## Visual Language

Arcalos should use a dark glass surface with restrained contrast and a cool accent.

Theme color decisions live in `theme/colors.conf`. Config files should consume or mirror those tokens instead of inventing local colors.

Palette:

- Base: `#090b10`
- Surface: `rgba(15, 18, 26, 0.72)`
- Surface strong: `rgba(22, 27, 38, 0.86)`
- Border: `rgba(148, 163, 184, 0.18)`
- Text: `#f8fafc`
- Muted text: `#94a3b8`
- Accent: `#38bdf8`
- Accent soft: `rgba(56, 189, 248, 0.18)`
- Warning: `#f59e0b`
- Critical: `#ef4444`

Spacing:

- Tight internal spacing: 6px
- Normal internal spacing: 10px
- Section spacing: 14px
- Outer shell margin: 6px

Shape:

- Main shell surfaces use 10-12px radius.
- Small pills and module surfaces use 8px radius.
- Do not introduce large rounded cards unless the component needs clear containment.

Glass:

- Glass surfaces should be translucent but readable.
- Use a subtle border to define the edge.
- Use shadows sparingly. The desktop should feel elevated, not heavy.

## Waybar Role

Waybar is the Arcalos identity layer.

It should communicate:

- the system name
- workspace state
- current time
- hardware and network status

The bar should read as part of the OS shell, not a generic status strip. Keep labels short and stable.

## Consistency Rules

- Prefer one primary shortcut per system concept.
- Keep launcher, bar, and window manager naming consistent: Spotlight means app search.
- Keep comments useful and operational.
- Avoid adding visual styles that do not map back to this file.
- When adding new UI, define whether it is shell, utility, workspace, or status.
- Treat `theme/colors.conf` as the color and glass source for shell UI.
- If a config breaks this document, change the config or update this document before shipping the config.

# Arcalos Design Language

## Core Feel
- soft glass UI
- blurred layered depth
- minimal visual noise
- consistent spacing everywhere

## Rules
- Every UI element must use the same rounding (12px)
- Backgrounds should be semi-transparent by default
- Only one accent color across the system
- No harsh borders or high contrast boxes unless focused

## Density
- UI should feel spacious, not packed
- Prefer fewer modules over more information
- Hide complexity unless user requests it

## Behavior
- SUPER key is system identity
- Everything should feel like one integrated shell
