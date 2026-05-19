echo "Fix JetBrains font setting"

if [[ $(arcalos-font-current) == JetBrains* ]]; then
  arcalos-font-set "JetBrainsMono Nerd Font"
fi
