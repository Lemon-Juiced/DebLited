#!/bin/bash

# Install gamer packages
echo "Installing gamer packages..."

# Ensure Flathub repository is added
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Discord via Flatpak
flatpak install flathub com.discordapp.Discord -y

# Install Steam via Flatpak
flatpak install flathub com.valvesoftware.Steam -y

# Ask user if they want to run the next script
read -p "Do you want to run the deblite customization script now? (y/n): " run_customization
if [[ "$run_customization" =~ ^[Yy]$ ]]; then
    echo "Running deblite customization script..."
    ./04_deblite_customize.sh
else
    echo "Skipping deblite customization script."
fi