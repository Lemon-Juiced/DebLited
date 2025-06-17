#!/bin/bash

# Elevate privileges if not already running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script requires root privileges. Please run it with sudo."
    exit 1
fi

# Remove unnecessary packages
echo "Removing unnecessary packages..."

apt remove --purge -y anthy-common anthy libanthy1 libanthyinput0
apt remove --purge -y firefox-esr 
apt remove --purge -y aisleriot five-or-more four-in-a-row gnome-2048 gnome-chess gnome-klotski gnome-mahjongg gnome-mines gnome-nibbles gnome-robots gnome-sudoku gnome-taquin gnome-tetravex hitori iagno lightsoff quadrapassel swell-foop tali
apt remove --purge -y goldendict
apt remove --purge -y hdate-applet libhdate1
apt remove --purge -y ibus-mozc mozc-data mozc-server mozc-utils-gui uim-mozc
apt remove --purge -y mlterm mlterm-common
apt remove --purge -y shotwell shotwell-common
apt remove --purge -y thunderbird
apt remove --purge -y transmission-common transmission-gtk
apt remove --purge -y xiterm+thai
apt autoremove -y

# Update all packages currently installed
echo "Updating all currently installed packages..."
apt update && apt upgrade -y

# Add new packages (Pre-requisites)
echo "Installing new packages (pre-reqs)..."
apt install -y flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
apt-get install gir1.2-gmenu-3.0
apt-get install chrome-gnome-shell

# Add new packages
echo "Installing new packages..."
flatpak install flathub eu.betterbird.Betterbird -y
curl -fsS https://dl.brave.com/install.sh | sh 
apt install -y cmake
apt install -y fish
apt install -y gdb
apt install -y geany
apt install -y git
apt install -y gnome-tweaks
apt install -y gparted
apt install -y htop
apt install -y kdenlive
apt install -y krita
apt install -y ksnip
apt install -y neofetch
apt install -y neovim
apt install -y unzip
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
  | gpg --dearmor \
  | sudo tee /usr/share/keyrings/vscodium-archive-keyring.gpg > /dev/null
echo 'deb [signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main' \
  | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt install codium

# Add additional gnome tweaks extensions
echo "Installing additional GNOME Tweaks extensions..."
gnome-extensions install https://extensions.gnome.org/extension/3628/arcmenu/
gnome-extensions install https://extensions.gnome.org/extension/1160/dash-to-panel/
gnome-extensions install https://extensions.gnome.org/extension/615/appindicator-support/
gnome-extensions enable arcmenu@arcmenu.com
gnome-extensions enable dash-to-panel@jderose9.github.com
gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com

# Restart the system to apply changes
echo "Installation complete. Would you like to restart your system now to apply the changes?"
read -r -p "Restart now? [Y/n]: " response

case "$response" in
    [Yy]*)
        echo "Restarting the system..."
        reboot
        ;;
    *)
        echo "You can restart your system later to apply the changes."
        ;;
esac