#!/bin/bash

# Remove unnecessary "bloat" packages
echo "Removing unnecessary packages..."
apt remove --purge -y anthy-common anthy libanthy1 libanthyinput0 firefox-esr \
    aisleriot five-or-more four-in-a-row gnome-2048 gnome-chess gnome-klotski gnome-mahjongg \
    gnome-mines gnome-nibbles gnome-robots gnome-sudoku gnome-taquin gnome-tetravex hitori \
    iagno lightsoff quadrapassel swell-foop tali goldendict hdate-applet libhdate1 \
    ibus-mozc mozc-data mozc-server mozc-utils-gui uim-mozc mlterm mlterm-common \
    shotwell shotwell-common thunderbird transmission-common transmission-gtk xiterm+thai
apt autoremove -y

# Update all packages currently installed
echo "Updating all currently installed packages..."
apt update && apt upgrade -y

# Ask user if they want to run the next script
read -p "Do you want to run the deblite installation script now? (y/n): " run_installation
if [[ "$run_installation" =~ ^[Yy]$ ]]; then
    echo "Running deblite installation script..."
    ./02_deblite_install.sh
else
    echo "Skipping deblite installation script."
fi