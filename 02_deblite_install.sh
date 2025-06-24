#!/bin/bash

# Install new packages
echo "Installing new packages..."
flatpak install flathub eu.betterbird.Betterbird com.brave.Browser com.vscodium.codium -y
apt install -y cmake fish gdb geany git gnome-shell-extensions gnome-shell-extension-prefs \
    gnome-tweaks gparted htop jq kdenlive krita ksnip make neofetch neovim unzip wget

# Ask user if they want to install gamer packages
read -p "Do you want to install gamer packages? (y/n): " gamer_installation
if [[ "$gamer_installation" =~ ^[Yy]$ ]]; then
    # We will run this script separately because we might want to add more gamer packages in updates
    echo "Running deblite gamer installation script..."
    ./03_deblite_gamer_install.sh
else
    echo "Skipping gamer installation script."
fi

# Ask user if they want to run the next script
read -p "Do you want to run the deblite customization script now? (y/n): " run_customization
if [[ "$run_customization" =~ ^[Yy]$ ]]; then
    echo "Running deblite customization script..."
    ./04_deblite_customize.sh
else
    echo "Skipping deblite customization script."
fi