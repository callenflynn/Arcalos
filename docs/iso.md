# Build ISO

This repository does not ship an `archiso` profile. Build your ISO with your own profile and include the package lists from:

- `install/omarchy-base.packages`
- `install/omarchy-other.packages`

Then run the installer on first boot.

## Linux (native build)

Prerequisites:

- Arch or Arch-based host
- `archiso` installed
- 10-20 GB of free disk space
- `git` and `sudo`

Steps:

1. Install archiso:
   - `sudo pacman -S --needed archiso`
2. Copy an official profile as a base:
   - `cp -r /usr/share/archiso/configs/releng ./arcalos-iso`
3. Add packages to `./arcalos-iso/packages.x86_64`:
   - Append the contents of `install/omarchy-base.packages`
   - Append the contents of `install/omarchy-other.packages`
4. Build the ISO:
   - `mkarchiso -v -w work -o out ./arcalos-iso`
5. Boot the ISO and run the online installer from the live system.

## macOS (build in a Linux VM)

Prerequisites:

- A Linux VM (UTM, VirtualBox, VMware, etc.)
- 20+ GB of free disk space for the VM
- A shared folder to copy the ISO out

Steps:

1. Create an Arch or Arch-based Linux VM.
2. Install `archiso` inside the VM.
3. Follow the Linux steps above to build the ISO.
4. Copy the ISO to the host using the shared folder.

## Windows (build in a Linux VM)

Prerequisites:

- A Linux VM (Hyper-V, VirtualBox, VMware, etc.)
- 20+ GB of free disk space for the VM
- A shared folder to copy the ISO out

Notes:

- `archiso` requires Linux with loop devices and elevated privileges.
- WSL2 is not a reliable environment for building `archiso` images.

Steps:

1. Create an Arch or Arch-based Linux VM.
2. Install `archiso` inside the VM.
3. Follow the Linux steps above to build the ISO.
4. Copy the ISO to the host using the shared folder.
