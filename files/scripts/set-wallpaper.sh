#!/usr/bin/env bash
set -oue pipefail

## CorviOS wallpaper
magick /usr/share/backgrounds/corvi-os/Corvi-OS.png -quality 100 /usr/share/backgrounds/corvi-os/corvi-os.jxl
ln -sf /usr/share/backgrounds/corvi-os/corvi-os.jxl /usr/share/backgrounds/default.jxl
ln -sf /usr/share/backgrounds/corvi-os/corvi-os.jxl /usr/share/backgrounds/default-dark.jxl
