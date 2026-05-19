echo "Fix microphone gain and audio mixing on Asus ROG laptops"

source "$ARCALOS_PATH/install/config/hardware/asus/fix-mic.sh"
source "$ARCALOS_PATH/install/config/hardware/asus/fix-audio-mixer.sh"

if arcalos-hw-asus-rog; then
  arcalos-restart-pipewire
fi
