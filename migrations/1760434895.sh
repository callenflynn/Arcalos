echo "Change to arcalos-nvim package"
arcalos-pkg-drop arcalos-lazyvim
arcalos-pkg-add arcalos-nvim

# Will trigger to overwrite configs or not to pickup new hot-reload themes
arcalos-nvim-setup
