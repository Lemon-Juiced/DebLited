#!/bin/bash

# Elevate privileges if not already running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script requires root privileges. Please run it with sudo."
    exit 1
fi

# Make the rest of the scipts executable
echo "Making scripts executable..."
chmod +x 01_deblite_uninstall.sh
chmod +x 02_deblite_install.sh
chmod +x 03_deblite_gamer_install.sh
chmod +x 04_deblite_customize.sh
chmod +x 05_deblite_lemix.sh
chmod +x 06_deblite_finalize.sh

# Get required packages early
echo "Getting required packages early..."
apt install -y wget

# Set up Flatpak Repo
echo "Setting up Flatpak repository..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install Flatpak plugin for GNOME Software
echo "Installing Flatpak plugin for GNOME Software..."
apt install -y gnome-software-plugin-flatpak
apt-get install gir1.2-gmenu-3.0
apt-get install chrome-gnome-shell

# Other prep work 
# So far nothing else is needed here, but placeholder for future use.

# Ask user if they want to run the next script
read -p "Do you want to run the deblite installation script now? (y/n): " run_installation
if [[ "$run_installation" =~ ^[Yy]$ ]]; then
    echo "Running deblite installation script..."
    bash 01_deblite_uninstall.sh
else
    echo "Skipping deblite debloat script."
fi