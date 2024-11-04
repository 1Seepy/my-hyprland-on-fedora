Installation can be done manually or through the install script.

***WARNING!*** THE INSTALL SCRIPT WILL ERASE ANY CONFIGURATIONS YOU ALREADY HAVE. MAKE BACKUPS IF YOU WANT TO KEEP THEM.

*Disclaimer:* This was designed for Fedora. The install script *will not* work on any distro that isn't very similar to fedora, and the dotfiles I cannot give any guarantees on.

### Automatic install
* Download the install script
* Execute it in your terminal

### Manual install
* Install dependendies:
```
sudo dnf copr enable solopasha/hyprland
sudo dnf copr enable azandure/clipse
sudo dnf install fish hyprland hyprpaper hyprlock hypridle hyprshot kitty fastfetch rofi-wayland swaync waybar wlogout wl-clipboard clipse btop python3-pip
pip install pyquery
```
* Allow flatpaks to use system themes
```
flatpak override --user --filesystem=/usr/share/icons:ro
```
* Clone the repository
* Move the dotfiles into ~/.config

(If a directory below isn't present, create it.)
* Move any wallpapers into ~/Pictures/Hyprpapers
* Move the cursor to ~/.icons
* Move the fonts to ~/.local/share/fonts

##### If you have any issues, idk.
