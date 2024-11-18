#!/bin/bash
swaync-client -R
swaync-client -rs
killall -9 waybar hyprpaper
waybar
sleep 1
hyprpaper
