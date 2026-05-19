echo "Add Logout option to system menu"

arcalos-refresh-sddm

if [[ -f /etc/sddm.conf.d/autologin.conf ]]; then
  sudo sed -i 's/^Current=.*/Current=arcalos/' /etc/sddm.conf.d/autologin.conf
fi
