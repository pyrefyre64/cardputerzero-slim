#!/bin/bash -e
# Slim CardputerZero image: stage 2 (Lite) plus what the launcher needs, booting to the console.
install -m 644 files/cardputerzero-cloud-init-once.service \
	"${ROOTFS_DIR}/etc/systemd/system/cardputerzero-cloud-init-once.service"

on_chroot << 'CHROOT'
# The launcher is a lingering user service that draws straight to the LCD; no desktop needed.
systemctl set-default multi-user.target
# cloud-init applies the imager's user, Wi-Fi and SSH settings once, then costs ~6 s per boot.
systemctl enable cardputerzero-cloud-init-once.service
# Checks for other Pi models or the desktop, if a package brought them in.
for unit in rpi-eeprom-update.service rp1-test.service glamor-test.service; do
	systemctl disable "$unit" 2>/dev/null || true
done
CHROOT
