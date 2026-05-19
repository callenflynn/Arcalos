echo "Replace buggy native Zoom client with webapp"

if arcalos-pkg-present zoom; then
  arcalos-pkg-drop zoom
  arcalos-webapp-install "Zoom" https://app.zoom.us/wc/home https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/zoom.png
fi
