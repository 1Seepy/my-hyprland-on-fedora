#!/bin/bash
killall dunst
killall waybar
killall wlsunset
killall hyprpaper
dunst & waybar & wlsunset -l 43 -L -76
sleep 1
hyprpaper
