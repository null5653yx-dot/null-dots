#!/bin/bash

# Path to your wallpaper folder
DIR="$HOME/Pictures/Wallpapers"
# File to store the current index
INDEX_FILE="$HOME/.cache/wall_index"

# Get all images in an array (sorted alphabetically)
PICS=($(ls $DIR/*.{jpg,jpeg,png,gif,webp} 2>/dev/null | sort))

# If no index file exists, start at 0
if [ ! -f "$INDEX_FILE" ]; then
    echo 0 > "$INDEX_FILE"
fi

# Read the current index
INDEX=$(cat "$INDEX_FILE")

# Calculate the next index (Loop back to 0 if at the end)
NEXT_INDEX=$(( (INDEX + 1) % ${#PICS[@]} ))

# Get the wallpaper path
WALLPAPER="${PICS[$INDEX]}"

# Set the wallpaper with awww
awww img "$WALLPAPER" --transition-type grow --transition-angle 30 --transition-step 90 --transition-fps 120 --transition-duration 1.5

# Save the NEXT index for the next click
echo "$NEXT_INDEX" > "$INDEX_FILE"
