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
sudo dnf update -y
echo "Updated."
echo "Installing packages..."
sudo dnf copr enable solopasha/hyprland azandure/clipse -y
sudo dnf install fish hyprland hyprlock hypridle hyprshot kitty fastfetch rofi-wayland swaync waybar wlogout wl-clipboard clipse btop python3-pip
pip install pyquery
echo "Installed packages."
echo "Cloning dotfiles..."
mkdir ~/Downloads/myfedorahyprland1324
git clone https://github.com/1Seepy/my-hyprland-on-fedora.git ~/Downloads/myfedorahyprland1324
cd ~/Downloads/myfedorahyprland1324/dotfiles
cp -f -r * ~/.config
echo "Prettying up..."
mkdir ~/Pictures/Hyprpapers
mkdir ~/.local/share/fonts
mkdir ~/.icons
cd ~/Downloads/myfedorahyprland1324/extras
cp *.png ~/Pictures/Hyprpapers
cp *.ttf ~/.local/share/fonts
cp -r * ~/.icons
echo "Cleaning up..."
cd ~/Downloads
rm -rf myfedorahyprland1324
echo "Done!"
read -p "To enter Hyprland you must reboot. Reboot later? [Y/n] " choice
case "$choice" in 
  n|N ) systemctl reboot;;
  y|Y ) echo "When you are logging back in, select Hyprland for your desktop session to enter hyprland.";;
  * ) echo "When you are logging back in, select Hyprland for your desktop session to enter hyprland.";;
esac
exit
