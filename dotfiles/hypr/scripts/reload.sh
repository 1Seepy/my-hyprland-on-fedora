#!/bin/bash
killall hyprpaper
killall waybar -9
hyprpaper &
waybar &
