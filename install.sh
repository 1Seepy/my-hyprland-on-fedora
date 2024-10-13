#!/bin/bash
echo "My Hyprland on Fedora will now install onto your system."
read -p "Proceed (y/n)? " choice
case "$choice" in 
  y|Y ) echo "Continuing.";;
  n|N ) exit;;
  * ) echo "Invalid.";;
esac
echo "Updating..."
sudo dnf update
echo "Updated."
echo "Installing Hyprland..."
sudo dnf install hyprland
sudo dnf install hyprland-devel
echo "Installed Hyprland."
echo "Installing kitty..."
sudo dnf install kitty
echo "Installed kitty."
echo "Installing fastfetch..."
sudo dnf install fastfetch
echo "Installed fastfetch."
echo "Installing rofi..."
sudo dnf install rofi-wayland
echo "Installed rofi."
echo "Installing waybar..."
sudo dnf install waybar
echo "Installed waybar."
echo "Installing wlogout..."
sudo dnf install wlogout
echo "Installed wlogout."
echo "Installing clipse..."
sudo dnf install wl-clipboard
sudo dnf copr enable azandure/clipse & echo "Enabling COPR repository..."
sudo dnf install clipse
echo "Cloning dotfiles..."
mkdir ~/Downloads/myfedorahyprland
git clone https://github.com/1Seepy/my-hyprland-on-fedora.git ~/Downloads/myfedorahyprland
cd ~/Downloads/myfedorahyprland/dotfiles
echo "If you have any configurations already setup, the terminal will now prompt you if you would like to replace them with these dotfiles. I would recommend replacing any defaults, but keeping any you made yourself."
echo "If you don't get prompted to overwrite any configurations, you can ignore this message."
mv -i * ~/.config
mkdir ~/Pictures/Hyprpapers
echo "Cleaning up..."
cd ~/Downloads
rm -rf myfedorahyprland
echo "Done!"
read -p "To enter Hyprland you have to logout. Logout now? " choice
case "$choice" in 
  y|Y ) sudo logout;;
  n|N ) exit;;
  * ) echo "Invalid.";;
esac
exit
