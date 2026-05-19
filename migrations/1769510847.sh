echo "Switch back to mainline chromium now that it supports full live theming"

if arcalos-pkg-present arcalos-chromium; then
  if gum confirm "Ready to switch to mainstream chromium? (Will close Chromium + reset settings)"; then
    pkill -x chromium
    arcalos-pkg-drop arcalos-chromium
    arcalos-pkg-add chromium
    arcalos-theme-set-browser
  fi
fi
