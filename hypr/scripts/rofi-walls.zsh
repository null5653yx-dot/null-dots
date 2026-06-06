#!/usr/bin/env zsh

WALL_DIR="/home/astal/Pictures/Wallpapers"

# Feed images into rofi's dmenu format: display_text\0icon\x1f/path/to/image
# The .rasi file hides the display_text, but the script still needs it to know what you picked!
SELECTED=$(find "$WALL_DIR" -maxdepth 1 -type f \( -iname \*.jpg -o -iname \*.png -o -iname \*.jpeg -o -iname \*.webp \) -printf "%f\n" | while read -r img; do
    echo -en "$img\0icon\x1f$WALL_DIR/$img\n"
done | rofi -dmenu -theme ~/.config/rofi/wall-picker.rasi -p "✨ Aesthetics")

# If you picked an image (and didn't just press escape)
if [[ -n "$SELECTED" ]]; then
    WALLPAPER="$WALL_DIR/$SELECTED"

    # -----------------------------------------------------
    # APPLY THE WALLPAPER HERE! (Uncomment the one you use)
    # -----------------------------------------------------

    # If you use SWWW (The transition is clean AF):
    awww img "$WALLPAPER" --transition-type grow --transition-angle 30 --transition-step 90 --transition-fps 120 --transition-duration 1.5

    # If you use Hyprpaper:
    # hyprctl hyprpaper preload "$WALLPAPER"
    # hyprctl hyprpaper wallpaper ",$WALLPAPER"

    notify-send "Vibe updated 💅" "Wallpaper changed!"
fi
