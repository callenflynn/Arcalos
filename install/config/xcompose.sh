# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
# Run arcalos-restart-xcompose to apply changes

# Include fast emoji access
include "%H/.local/share/arcalos/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$ARCALOS_USER_NAME"
<Multi_key> <space> <e> : "$ARCALOS_USER_EMAIL"
EOF
