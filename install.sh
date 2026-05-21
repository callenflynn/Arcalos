#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Define Arcalos locations
export ARCALOS_PATH="$HOME/.local/share/arcalos"
export ARCALOS_INSTALL="$ARCALOS_PATH/install"
export ARCALOS_INSTALL_LOG_FILE="/var/log/arcalos-install.log"
export PATH="$ARCALOS_PATH/bin:$PATH"

# Ensure arcalos-* command shims exist during install (repo ships omarchy-* binaries).
ensure_arcalos_shim() {
  local command_path="$1"
  local command_name="${command_path##*/}"
  local arcalos_name="arcalos-${command_name#omarchy-}"
  local arcalos_path="$ARCALOS_PATH/bin/$arcalos_name"

  if [[ -e $arcalos_path ]]; then
    if [[ ! -x $arcalos_path ]]; then
      chmod +x "$arcalos_path"
    fi
    return
  fi

  if [[ -x $command_path ]]; then
    if ln -s "$command_path" "$arcalos_path" 2>/dev/null; then
      return
    fi
  fi

  printf '%s\n' '#!/bin/bash' "exec bash \"$command_path\" \"\$@\"" > "$arcalos_path"
  chmod +x "$arcalos_path"
}

if [[ -d $ARCALOS_PATH/bin ]]; then
  for command_path in "$ARCALOS_PATH"/bin/omarchy-*; do
    [[ -e $command_path ]] || continue
    ensure_arcalos_shim "$command_path"
  done
fi

# Legacy Omarchy environment variables for backwards compatibility
export OMARCHY_PATH="$ARCALOS_PATH"
export OMARCHY_INSTALL="$ARCALOS_INSTALL"
export OMARCHY_INSTALL_LOG_FILE="$ARCALOS_INSTALL_LOG_FILE"

# Install
source "$ARCALOS_INSTALL/helpers/all.sh"
source "$ARCALOS_INSTALL/preflight/all.sh"
source "$ARCALOS_INSTALL/packaging/all.sh"
source "$ARCALOS_INSTALL/config/all.sh"
source "$ARCALOS_INSTALL/login/all.sh"
source "$ARCALOS_INSTALL/post-install/all.sh"
