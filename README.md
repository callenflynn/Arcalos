# Arcalos

Arcalos is a sleek, modern, beautiful, and opinionated Linux skin built on Arch, by Cal.

Read more at [arcalos.dev](https://arcalos.dev).

## Install (online)

From an Arch-based live environment:

```bash
export OMARCHY_REPO=callenflynn/Arcalos
export OMARCHY_REF=master
curl -fsSL https://raw.githubusercontent.com/callenflynn/Arcalos/master/boot.sh | bash
```

This clones into `~/.local/share/omarchy` and runs `install.sh`.

## Build ISO (Arch)

This repository does not ship an `archiso` profile. Build your ISO with your own profile and include the package lists from `install/omarchy-base.packages` and `install/omarchy-other.packages`, then run the installer on first boot.

Example build command (from an Arch host with `archiso` installed):

```bash
sudo pacman -S --needed archiso
mkarchiso -v -w work -o out /path/to/your/profile
```

## License

Arcalos is released under the [MIT License](https://opensource.org/licenses/MIT).
