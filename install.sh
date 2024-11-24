#!/bin/bash
clear
echo "My Hyprland on Fedora will now install onto your system."
read -p "Proceed (y/N)? " choice
case "$choice" in 
  y|Y ) echo "Continuing.";;
  n|N ) return;;
  * ) return;;
esac
echo "Updating..."
sudo dnf update --refresh -yq
echo "Updated."
echo "Installing packages..."
sudo dnf copr enable solopasha/hyprland > /dev/null 2>&1
sudo dnf copr enable azandure/clipse > /dev/null 2>&1
sudo dnf copr enable wezfurlong/wezterm-nightly > /dev/null 2>&1
sudo dnf install fish wezterm hyprland hyprpaper hyprlock hypridle hyprshot hyprpolkitagent fastfetch rofi-wayland swaync waybar wlogout wl-clipboard clipse btop python3-pip candy-icon-theme -yq
pip install pyquery
echo "Installed packages."
echo "Cloning dotfiles..."
mkdir ~/Downloads/myfedorahyprland1324 ~/.configtemp
git clone https://github.com/1Seepy/my-hyprland-on-fedora.git -b kellen ~/Downloads/myfedorahyprland1324
cd ~/.config
mv * ~/.configtemp
cd ~/Downloads/myfedorahyprland1324/dotfiles
mv -f * ~/.config
echo "Restoring..."
cd ~/.configtemp
mv -n * ~/.config
echo "Prettying up..."
mkdir ~/Pictures/Hyprpapers ~/.local/share/fonts ~/.local/share/icons
cd ~/Downloads/myfedorahyprland1324/extras
mv -f wallpaper* ~/Pictures/Hyprpapers
cd Fonts
mv -f * ~/.local/share/fonts
cd ..
rm -rf Fonts
mv -f * ~/.local/share/icons
flatpak override --user --filesystem=~/.local/share/icons:ro
echo "Cleaning up..."
cd ~/Downloads
rm -rf myfedorahyprland1324
rm -rf ~/.configtemp
echo "Done!"
read -p "To enter Hyprland you must reboot. Reboot later? [Y/n] " choice
case "$choice" in 
  y|Y ) echo "When you are logging back in, select Hyprland for your desktop session to enter hyprland.";;
  n|N ) systemctl reboot;;
  * ) echo "When you are logging back in, select Hyprland for your desktop session to enter hyprland.";;
esac
