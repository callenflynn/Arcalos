echo "Migrate to proper packages for localsend and asdcontrol"

if arcalos-pkg-present localsend-bin; then
  arcalos-pkg-drop localsend-bin
  arcalos-pkg-add localsend
fi

if arcalos-pkg-present asdcontrol-git; then
  arcalos-pkg-drop asdcontrol-git
  arcalos-pkg-add asdcontrol
fi
