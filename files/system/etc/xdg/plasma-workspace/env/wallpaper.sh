
# Force set wallpaper
if [ "{$XDG_CURRENT_DESKTOP:-}" = "KDE" ]; then
    WALLPAPER_PATH="/usr/share/backgrounds/default.jxl"
    
    # Check if a custom marker exists
    if [ ! -f "$HOME/.config/custom_wallpaper_set" ]; then
        plasma-apply-wallpaperimage "$WALLPAPER_PATH"
        
        touch "$HOME/.config/custom_wallpaper_set"
    fi
fi
