Installation can be done manually or through the install script.

***WARNING!*** THE INSTALL SCRIPT WILL ERASE ANY CONFIGURATIONS YOU ALREADY HAVE. MAKE BACKUPS IF YOU WANT TO KEEP THEM.

*Disclaimer:* This was designed for Fedora 41. The install script *will only* work on RPM-based distros, and the dotfiles I cannot give any guarantees for.

### Automatic install
* Download the install script
* Execute it in your terminal

### Manual install
* Install dependendies:
```
sudo dnf copr enable solopasha/hyprland
sudo dnf copr enable azandure/clipse
sudo dnf copr enable wezfurlong/wezterm-nightly
sudo dnf install fish qt6ct qt6-qtwayland hyprland hyprpaper hyprlock hypridle hyprshot hyprpolkitagent wezterm fastfetch rofi-wayland swaync waybar wlogout wl-clipboard clipse btop python3-pip candy-icon-theme
pip install pyquery
```
* Allow flatpaks to use system themes:
```
flatpak override --user --filesystem=~/.local/share/icons:ro
```
* Clone the repository
* Move the dotfiles into ~/.config

(If a directory below doesn't exist, create it.)
* Move any wallpapers into ```~/Pictures/Hyprpapers```
* Move the cursor to ```~/.local/share/icons```
* Move the fonts to ```~/.local/share/fonts```

##### If you have any issues, idk.
