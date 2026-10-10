#!/usr/bin/env bash
set -oue pipefail


# Corvus-OS wallpaper
magick /usr/share/backgrounds/corvus-os/Corvus-OS.png -quality 100 /usr/share/backgrounds/corvus-os/corvus-os.jxl #convert to .jxl
ln -sf /usr/share/backgrounds/corvus-os/corvus-os.jxl /usr/share/backgrounds/default.jxl #defaul.jxl
ln -sf /usr/share/backgrounds/corvus-os/corvus-os.jxl /usr/share/backgrounds/default-dark.jxl #default-dark.jxl

rm -f /usr/share/backgrounds/default.xml #remove old default.xml

mkdir -p /usr/share/wallpapers/corvus-os/default/contents/images #add directory folders
ln -s /usr/share/backgrounds/corvus-os/corvus-os.jxl /usr/share/wallpapers/corvus-os/default/contents/images/3940x2160.jxl #Add wallaper to directory 

set +u
# Force set wallpaper
if [ "{$XDG_CURRENT_DESKTOP:-}" = "KDE" ]; then
    WALLPAPER_PATH="/usr/share/backgrounds/default.jxl"
    
    # Check if a custom marker exists
    if [ ! -f "$HOME/.config/custom_wallpaper_set" ]; then
        plasma-apply-wallpaperimage "$WALLPAPER_PATH"
        
        touch "$HOME/.config/custom_wallpaper_set"
    fi
fi
set -u