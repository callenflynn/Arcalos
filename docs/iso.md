# Build ISO (Arch)

This repository does not ship an `archiso` profile. Build your ISO with your own profile and include the package lists from:

- `install/omarchy-base.packages`
- `install/omarchy-other.packages`

Then run the installer on first boot.

Example build command (from an Arch host with `archiso` installed):

```bash
sudo pacman -S --needed archiso
mkarchiso -v -w work -o out /path/to/your/profile
```
