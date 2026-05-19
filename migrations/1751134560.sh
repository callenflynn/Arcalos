echo "Add UWSM env"

export ARCALOS_PATH="$HOME/.local/share/arcalos"
export PATH="$ARCALOS_PATH/bin:$PATH"

mkdir -p "$HOME/.config/uwsm/"
cat <<EOF | tee "$HOME/.config/uwsm/env"
export ARCALOS_PATH=$HOME/.local/share/arcalos
export PATH=$ARCALOS_PATH/bin/:$PATH
EOF

# Ensure we have the latest repos and are ready to pull
arcalos-update-keyring
arcalos-refresh-pacman
sudo systemctl restart systemd-timesyncd
sudo pacman -Sy # Normally not advisable, but we'll do a full -Syu before finishing

mkdir -p ~/.local/state/arcalos/migrations
touch ~/.local/state/arcalos/migrations/1751134560.sh

# Remove old AUR packages to prevent a super lengthy build on old arcalos installs
arcalos-pkg-drop zoom qt5-remoteobjects wf-recorder wl-screenrec

# Get rid of old AUR packages
bash $ARCALOS_PATH/migrations/1756060611.sh
touch ~/.local/state/arcalos/migrations/1756060611.sh

bash arcalos-update-perform
