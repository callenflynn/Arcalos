# Install all base packages
mapfile -t packages < <(grep -v '^#' "$ARCALOS_INSTALL/arcalos-base.packages" | grep -v '^$')
arcalos-pkg-add "${packages[@]}"
