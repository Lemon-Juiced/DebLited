#!/bin/bash

# Download DTar files
echo "Downloading DTar files..."
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
echo "Updating man database..."
mandb

# Make all scripts executable
echo "Making scripts executable..."
chmod +x /usr/local/bin/*

# Ask user if they want to run the next script
read -p "Do you want to run the deblite finalize script now? (y/n): " run_finalize
if [[ "$run_finalize" =~ ^[Yy]$ ]]; then
    echo "Running deblite finalize script..."
    ./06_deblite_finalize.sh
else
    echo "Skipping deblite finalize script."
fi

echo "You will have to reboot your system for the changes to take effect."