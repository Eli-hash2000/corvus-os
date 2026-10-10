#!/usr/bin/env bash
set -oue pipefail

## CorviOS wallpaper
magick /usr/share/backgrounds/corvi-os/Corvi-OS.png -quality 100 /usr/share/backgrounds/corvi-os/corvi-os.jxl
ln -sf /usr/share/backgrounds/corvi-os/corvi-os.jxl /usr/share/backgrounds/default.jxl
ln -sf /usr/share/backgrounds/corvi-os/corvi-os.jxl /usr/share/backgrounds/default-dark.jxl

rm -f /usr/share/backgrounds/default.xml

mkdir -p /usr/share/wallpapers/corvus-os/default/contents/images
ln -s /usr/share/backgrounds/corvi-os/corvi-os.jxl /usr/share/wallpapers/corvus-os/default/contents/images/3940x2160.jxl 
