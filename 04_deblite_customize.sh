#!bin/bash

# Customize Brave Browser (To Do)
echo "Customizing Brave Browser..."

# Add additional GNOME Extensions
echo "Installing additional GNOME Extensions system-wide..."
sudo apt install gnome-shell-extension-arc-menu gnome-shell-extension-dash-to-panel gnome-shell-extension-appindicator
gsettings set org.gnome.shell enabled-extensions "['arcmenu@arcmenu.com', 'dash-to-panel@jderose9.github.com', 'appindicatorsupport@rgcjonas.gmail.com']"

# Add custom 'll' and 'cls' command aliases
echo "Adding custom command aliases..."
echo "alias ll='ls -l'" >> /etc/bash.bashrc
echo "alias cls='clear'" >> /etc/bash.bashrc

## Set default shell to fish for all users
echo "Setting fish as the default shell for all users..."
if ! grep -q "/usr/bin/fish" /etc/shells; then
    echo "/usr/bin/fish" >> /etc/shells
fi
for user in $(cut -d: -f1 /etc/passwd); do
    chsh -s /usr/bin/fish "$user"
done

# Ask user if they want to run the next script
read -p "Do you want to run the deblite lemix script now? (y/n): " run_lemix
if [[ "$run_lemix" =~ ^[Yy]$ ]]; then
    echo "Running deblite lemix script..."
    ./05_deblite_customize.sh
else
    echo "Skipping deblite lemix script."
fi