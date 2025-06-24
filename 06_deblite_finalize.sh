#!/bin/bash

# Reboot the system to apply changes
echo "Rebooting the system to apply changes..."

# Countdown from 5 seconds - give the user time to cancel if needed
for i in {5..1}; do
    echo "Rebooting in $i seconds..."
    sleep 1
done
sudo reboot
