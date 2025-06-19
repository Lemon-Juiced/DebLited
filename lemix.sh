#!/bin/bash

# Elevate privileges if not already running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script requires root privileges. Please run it with sudo."
    exit 1
fi

# Check if wget is installed, if not, install it
if ! command -v wget &> /dev/null; then
    echo "wget is not installed. Installing wget..."
    apt update && apt install -y wget
fi

# wget the `aptb` and `DTar` files
echo "Downloading aptb and DTar files..."
# To Do: wget aptb
wget https://github.com/Lemon-Juiced/DTar/releases/download/v0.0.3/DTar.tar.gz

# Unzip the DTar file
echo "Unzipping DTar file..."
tar -xzf DTar.tar.gz
rm DTar.tar.gz

# Extract DTar.tar.gz and organize contents
echo "Extracting DTar.tar.gz..."
tar -xzf DTar.tar.gz
mkdir -p /usr/local/share/man/man1
mv linux/man/* /usr/local/share/man/man1/
mv linux/* /usr/local/bin/
# Update man database
mandb

# Make all scripts executable
echo "Making scripts executable..."
chmod +x /usr/local/bin/*

echo "Installation completed successfully."
