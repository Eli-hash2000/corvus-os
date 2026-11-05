#!/usr/bin/env bash
set -oue pipefail


# Corvus-OS wallpaper
magick /usr/share/backgrounds/corvus/Corvus-OS.png -quality 100 /usr/share/backgrounds/corvus/corvus-os.jxl #convert to .jxl
ln -sf /usr/share/backgrounds/corvus/corvus-os.jxl /usr/share/backgrounds/default.jxl #defaul.jxl
ln -sf /usr/share/backgrounds/corvus/corvus-os.jxl /usr/share/backgrounds/default-dark.jxl #default-dark.jxl

rm -f /usr/share/backgrounds/default.xml #remove old default.xml

ln -s /usr/share/backgrounds/corvus/Corvus-OS.png /usr/share/wallpapers/corvus/contents/images/2000x1500.png #Add wallaper to directory 

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
