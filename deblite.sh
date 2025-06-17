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
apt remove --purge -y aisleriot five-or-more four-in-a-row gnome-2048 gnome-chess gnome-klotski gnome-mahjongg gnome-mines gnome-nibbles gnome-robots gnome-sudoku gnome-tetravex hitori iagno lightsoff quadrapassel tali
apt remove --purge -y goldendict
apt remove --purge -y hdate-applet libhdate1
apt remove --purge -y mlterm mlterm-common
apt remove --purge -y mozc ibus-mozc mozc-data mozc-utils-gui uim-mozc
apt remove --purge -y shotwell shotwell-common
apt remove --purge -y thunderbird
apt remove --purge -y transmission-common transmission-gtk
apt remove --purge -y xiterm+thai
apt autoremove -y

# Add new packages (Pre-requisites)
echo "Installing new packages (pre-reqs)..."
apt install -y flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Add new packages
echo "Installing new packages..."
flatpak install flathub eu.betterbird.Betterbird -y
curl -fsS https://dl.brave.com/install.sh | sh 

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