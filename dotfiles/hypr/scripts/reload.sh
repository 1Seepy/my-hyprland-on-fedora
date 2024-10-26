#!/bin/bash
killall swaync
killall waybar
killall wlsunset
killall hyprpaper
swaync & waybar & wlsunset -l 43 -L -76
sleep 1
hyprpaper
