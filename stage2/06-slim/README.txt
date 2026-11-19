Slim CardputerZero build (pyrefyre64/cardputerzero-slim).
Adds PipeWire (only the desktop stages pulled it in, and the launcher's app audio uses it),
adds libinput10 (APPLaunch, LaunchWizard, AppStore and ZClaw link libinput.so.10, but the
applaunch package only declares xdg-user-dirs; labwc used to pull it in),
boots to multi-user.target, and turns cloud-init off after the first boot.
