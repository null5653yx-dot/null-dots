#!/usr/bin/env zsh

# Set up the target directory
DIR="/home/astal/Pictures/Wallpapers"

# Big brain move: Pick a random page between 1 and 5 so we get from the top 120ish wallpapers
PAGE=$(( (RANDOM % 5) + 1 ))

# Toplist API (Gen/Anime, SFW, 16x9, Top of 1 Month, Random Page)
API_URL="https://wallhaven.cc/api/v1/search?categories=110&purity=100&atleast=1920x1080&ratios=16x9&topRange=1M&sorting=toplist&order=desc&page=${PAGE}"

# Send a quick popup
notify-send "Wallhaven" "Hunting for top-tier aesthetics... 🕵️‍♂️" -t 2000

# Fetch API data, extract all image URLs, and let `shuf` pick one random banger
IMG_URL=$(curl -s "$API_URL" | jq -r '.data[].path' | shuf -n 1)

if [[ -z "$IMG_URL" || "$IMG_URL" == "null" ]]; then
    notify-send "Wallhaven" "API tripped or offline. No wallpaper for you 💀" -u critical
    exit 1
fi

# Extract the filename
FILENAME=$(basename "$IMG_URL")
DEST="$DIR/$FILENAME"

# Download the file
curl -s -o "$DEST" "$IMG_URL"

if [[ $? -eq 0 ]]; then
    notify-send "Wallhaven" "Secured the bag! 🎒"

    # Applied in Hyprland using swww!
    awww img "$DEST" --transition-type grow --transition-angle 30 --transition-step 90 --transition-fps 120 --transition-duration 1.5

else
    notify-send "Wallhaven" "Download failed mid-way 😭" -u critical
fi
