# Show installation environment variables
gum log --level info "Installation Environment:"

env | grep -E "^(ARCALOS_CHROOT_INSTALL|ARCALOS_ONLINE_INSTALL|ARCALOS_USER_NAME|ARCALOS_USER_EMAIL|USER|HOME|ARCALOS_REPO|ARCALOS_REF|ARCALOS_PATH)=" | sort | while IFS= read -r var; do
  gum log --level info "  $var"
done
