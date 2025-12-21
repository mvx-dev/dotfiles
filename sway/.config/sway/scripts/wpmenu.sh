#!/bin/bash

WALLPAPER_DIR="$HOME/.assets/wallpapers"

choice=$(cd "$WALLPAPER_DIR" && find . -type f -printf '%P\n' | rofi -dmenu -p "Select a wallpaper")
if [[ -n "$choice" ]]; then
    notify-send -t 3000 "Wallpaper changed to $choice."

    rm "$WALLPAPER_DIR/wallpaper.jpg"
    ln -s "$WALLPAPER_DIR/$choice" "$WALLPAPER_DIR/wallpaper.jpg"

    killall swaybg
    swaybg -i "$WALLPAPER_DIR/$choice"
fi
