#!/bin/bash
swaync-client -R
swaync-client -rs
killall waybar hyprpaper
waybar
sleep 1
hyprpaper
