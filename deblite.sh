#!bin/bash

## This file is an artifact of the original build script, it does not need to be run, but it sure doesn't hurt.

# Makes sure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script requires root privileges. Please run it with sudo."
    exit 1
fi

chmod +x 00_deblite_preprocess.sh
./00_deblite_preprocess.sh