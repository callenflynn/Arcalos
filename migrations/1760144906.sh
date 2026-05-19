echo "Change arcalos-screenrecord to use gpu-screen-recorder"
arcalos-pkg-drop wf-recorder wl-screenrec

# Add slurp in case it hadn't been picked up from an old migration
arcalos-pkg-add slurp gpu-screen-recorder
