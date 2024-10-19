#!/bin/bash
echo "My Hyprland on Fedora will now install onto your system."
read -p "Proceed (y/n)? " choice
case "$choice" in 
  y|Y ) echo "Continuing.";;
  n|N ) exit;;
  * ) echo "I'll assume that means no, for safety." & exit;;
esac
echo "Updating..."
sudo dnf update
echo "Updated."
echo "Installing Hyprland..."
sudo dnf install hyprland
sudo dnf install hyprland-devel
sudo dnf install hyprpaper
sudo dnf install hyprpicker
sudo dnf install hyprlock
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
echo "Installing dunst..."
sudo dnf install dunst
echo "Installed dunst."
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
echo "Installed clipse."
echo "Installing btop..."
sudo dnf install btop
echo "Installed btop."
echo "Installing pyquery..."
sudo dnf install python3-pip
pip install pyquery
echo "Installed pyquery."
echo "Cloning dotfiles..."
mkdir ~/Downloads/myfedorahyprland
git clone https://github.com/1Seepy/my-hyprland-on-fedora.git ~/Downloads/myfedorahyprland
cd ~/Downloads/myfedorahyprland/dotfiles
echo "If you have any configurations already setup, the terminal will now prompt you if you would like to replace them with these dotfiles. I would recommend replacing any defaults, but keeping any you made yourself."
echo "If you don't get prompted to overwrite any configurations, you can ignore this message."
mv -i -f * ~/.config
echo "Prettying up..."
mkdir ~/Pictures/Hyprpapers
mkdir ~/.local/share/fonts
mkdir ~/.icons
cd ~/Downloads/myfedorahyprland/extras
mv *.png ~/Pictures/Hyprpapers
mv *.ttf ~/.local/share/fonts
mv * ~/.icons
echo "Cleaning up..."
cd ~/Downloads
rm -rf myfedorahyprland
echo "Done!"
read -p "To enter Hyprland you must reboot. Reboot now? " choice
case "$choice" in 
  y|Y ) systemctl reboot;;
  n|N ) echo "When you are logging back in, select Hyprland for your desktop session to enter hyprland.";;
  * ) echo "I'll assume that means no, for safety." & echo "When you are logging back in, select Hyprland for your desktop session to enter hyprland.";;
esac
exit
