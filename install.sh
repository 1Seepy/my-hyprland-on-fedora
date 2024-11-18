#!/bin/bash
clear
echo "My Hyprland on Fedora will now install onto your system."
read -p "Proceed (N/y)? " choice
case "$choice" in 
  y|Y ) echo "Continuing.";;
  n|N ) exit;;
  * ) exit;;
esac
echo "Updating..."
sudo dnf update --refresh -y
echo "Updated."
echo "Installing packages..."
sudo dnf copr enable solopasha/hyprland -yq
sudo dnf copr enable azandure/clipse -yq
sudo dnf copr enable wezfurlong/wezterm-nightly -yq
sudo dnf install fish hyprland hyprpaper hyprlock hypridle hyprshot hyprpolkitagent fastfetch rofi-wayland swaync waybar wlogout wl-clipboard clipse btop python3-pip candy-icon-theme -y
pip install pyquery
echo "Installed packages."
echo "Cloning dotfiles..."
mkdir ~/Downloads/myfedorahyprland1324 ~/.configtemp
git clone https://github.com/1Seepy/my-hyprland-on-fedora.git ~/Downloads/myfedorahyprland1324
cd ~/.config
mv * ~/.configtemp
cd ~/Downloads/myfedorahyprland1324/dotfiles
mv -f * ~/.config
cd ~/.config/swaync
cp style.css /etc/xdg/swaync
echo "Restoring..."
cd ~/.configtemp
mv * ~/.config
echo "Prettying up..."
mkdir ~/Pictures/Hyprpapers ~/.local/share/fonts ~/.icons
cd ~/Downloads/myfedorahyprland1324/extras
mv -f wallpaper* ~/Pictures/Hyprpapers
cd Fonts
mv -f * ~/.local/share/fonts
cd ..
mv -f * ~/.local/share/icons
flatpak override --user --filesystem=/usr/share/icons:ro
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
exit
