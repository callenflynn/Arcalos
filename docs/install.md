# Install (online)

See [Installation options](/installation-options) if you are not sure which path to take.

From an Arch-based live environment:

```bash
export OMARCHY_REPO=callenflynn/Arcalos
export OMARCHY_REF=master
curl -fsSL https://raw.githubusercontent.com/callenflynn/Arcalos/master/boot.sh | bash
```

This clones into `~/.local/share/omarchy` and runs `install.sh`.
