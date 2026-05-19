# Install (online)

See [Installation options](/installation-options) if you are not sure which path to take.

This one-liner is meant to run after Arch is already installed. First use `archinstall` to install Arch, reboot into the new system, then run the command below.

From the installed Arch system:

```bash
export ARCALOS_REPO=callenflynn/Arcalos
export ARCALOS_REF=master
curl -fsSL https://raw.githubusercontent.com/callenflynn/Arcalos/master/boot.sh | bash
```

This clones into `~/.local/share/arcalos` and runs `install.sh`.
