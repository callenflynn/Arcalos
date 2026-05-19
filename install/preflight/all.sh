source $ARCALOS_INSTALL/preflight/guard.sh
source $ARCALOS_INSTALL/preflight/begin.sh
run_logged $ARCALOS_INSTALL/preflight/show-env.sh
run_logged $ARCALOS_INSTALL/preflight/pacman.sh
run_logged $ARCALOS_INSTALL/preflight/migrations.sh
run_logged $ARCALOS_INSTALL/preflight/first-run-mode.sh
run_logged $ARCALOS_INSTALL/preflight/disable-mkinitcpio.sh
