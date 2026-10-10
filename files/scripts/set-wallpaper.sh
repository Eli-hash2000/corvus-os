#!/usr/bin/env bash
set -oue pipefail

## CorviOS wallpaper
magick /usr/share/backgrounds/corvus-os/Corvus-OS.png -quality 100 /usr/share/backgrounds/corvus-os/corvus-os.jxl
ln -sf /usr/share/backgrounds/corvus-os/corvus-os.jxl /usr/share/backgrounds/default.jxl
ln -sf /usr/share/backgrounds/corvus-os/corvus-os.jxl /usr/share/backgrounds/default-dark.jxl

rm -f /usr/share/backgrounds/default.xml

mkdir -p /usr/share/wallpapers/corvus-os/default/contents/images
ln -s /usr/share/backgrounds/corvus-os/corvus-os.jxl /usr/share/wallpapers/corvus-os/default/contents/images/3940x2160.jxl 

# Ensure it only runs in a graphical KDE Plasma session
if [ "$XDG_CURRENT_DESKTOP" = "KDE" ]; then
    # Path to your custom baked wallpaper
    WALLPAPER_PATH="/usr/share/backgrounds/default.jxl"
    
    # Check if a custom marker exists so it doesn't overwrite a user's intentional changes later
    if [ ! -f "$HOME/.config/custom_wallpaper_set" ]; then
        # Use KDE's built-in CLI tool to apply the wallpaper
        plasma-apply-wallpaperimage "$WALLPAPER_PATH"
        
        # Create a marker so the user can still change their wallpaper if they want to
        touch "$HOME/.config/custom_wallpaper_set"
    fi
fi
