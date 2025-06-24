# DebLited
DebLited, a play on de-blight, is a script designed to transform a basic installation of Debian 12.11.0 with the GNOME Desktop Environment into a customized build of LemOS. It simplifies the setup process by automating package installation, removal, and GNOME tweaks.

## Usage
To use DebLited, follow these steps:
1. Start with a fresh Debian 12.11.0 installation with GNOME Desktop.
2. Run the `deblite.sh` script to apply the changes.

Ensure you have execution permissions for the script:

```bash
chmod +x deblite.sh
./deblite.sh
```

Additionally, you can run with the `-g` flag to have a "Gamer Install" which installs a few more commonly used "Gamer" programs.
```bash
chmod +x deblite.sh
./deblite.sh -g
```

## Project Organization
DebLited is now segmented into multiple scripts for better modularity and maintainability:

### Scripts
1. **`deblite.sh`**: 
   - Optional entry into the program, artifact from the original build script.
   - Extra protection to make sure user is running as sudo, and runs `00_deblite_preprocess.sh`.

2. **`00_deblite_preprocess.sh`**:
   - Prepares the system by installing required tools and setting up repositories.
   - Makes all other scripts executable.

3. **`01_deblite_uninstall.sh`**:
   - Removes unnecessary packages to streamline the system.
   - Updates all currently installed packages.

4. **`02_deblite_install.sh`**:
   - Installs essential packages and tools.
   - Prompts the user to install gamer packages.

5. **`03_deblite_gamer_install.sh`**:
   - Installs gamer-specific packages like Discord and Steam.

6. **`04_deblite_customize.sh`**:
   - Customizes the system with GNOME extensions, aliases, and sets the default shell to fish.

7. **`05_deblite_lemix.sh`**:
   - Downloads and installs DTar files.
   - Updates the man database.

8. **`06_deblite_finalize.sh`**:
   - Finalizes the installation and reboots the system.

## Features

### Removed Packages
DebLited removes the following packages to streamline the system:

- **Japanese Input Method Packages**: `anthy-common`, `anthy`, `libanthy1`, `libanthyinput0`, `ibus-mozc`, `mozc-data`, `mozc-server`, `mozc-utils-gui`, `uim-mozc`.
- **Firefox ESR**: The extended support release of Firefox.
- **Gnome Games**: Pre-installed games including `aisleriot`, `five-or-more`, `four-in-a-row`, `gnome-2048`, `gnome-chess`, `gnome-klotski`, `gnome-mahjongg`, `gnome-mines`, `gnome-nibbles`, `gnome-robots`, `gnome-sudoku`, `gnome-taquin`, `gnome-tetravex`, `hitori`, `iagno`, `lightsoff`, `quadrapassel`, `swell-foop`, `tali`.
- **Goldendict**: A dictionary application.
- **Hebrew Calendar Applet and Library**: `hdate-applet`, `libhdate1`.
- **Multilingual Terminal Emulator**: `mlterm`, `mlterm-common`.
- **Photo Management Application**: `shotwell`, `shotwell-common`.
- **Default Email Client**: `thunderbird`.
- **BitTorrent Client**: `transmission-common`, `transmission-gtk`.
- **Thai Terminal Emulator**: `xiterm+thai`.

### Installed Packages
DebLited installs the following packages to enhance functionality:
- `betterbird`: An improved version of Thunderbird email client.
- `brave-browser`: A privacy-focused web browser.
- `cmake`: A cross-platform tool for managing the build process of software.
- `fish`: A user-friendly shell with advanced features.
- `flatpak`, `gnome-software-plugin-flatpak`: A system for distributing and running sandboxed desktop applications.
- `gdb`: A powerful debugger for C and C++.
- `geany`: A lightweight IDE.
- `git`: A powerful VCS tool.
- `gnome-shell-extensions`, `gnome-shell-extension-prefs`: Tools for managing GNOME extensions.
- `gnome-tweaks`: A tool for customizing GNOME.
- `gparted`: A partition editor.
- `htop`: An interactive process viewer for Unix systems.
- `jq`: A lightweight and flexible command-line JSON processor.
- `kdenlive`: A video editing software.
- `krita`: A digital painting application.
- `ksnip`: A screenshot tool.
- `make`: A tool for executing build instructions.
- `neofetch`: A system information tool.
- `neovim`: An advanced text editor for developers.
- `unzip`: A utility for extracting compressed files.
- `vscodium`: An open-source version of Visual Studio Code.
- `wget`: A command-line tool to download files from the internet.

*... and their dependencies.*

#### Gamer Installation Additional Packages
- `discord`: Gamer-focused communication software.
- `steam`: The largest and most-reputable digital storefront for games.

#### Custom Brave Browser Tweaks (To Do)
- **Show Home Button**: Enabled
- **Show Bookmarks**: Always
- **Show Brave News Button**: Disabled
- **Show Brave Wallet Button**: Disabled
- **Use Wide Address Bar**: Enabled
- **Always Show Full URLs**: Enabled

### Installed GNOME Tweaks (Needs Work)
DebLited applies the following GNOME tweaks to improve usability:
- `arcmenu`: A customizable application menu.
- `dash-to-panel`: Combines the GNOME dash and top panel into a single panel.
- `gnome-shell-extension-appindicator`: Adds support for application indicators and status notifiers.

### Custom Command Aliases
- `ll`: Alias for `ls -l`
- `cls`: Alias for `clear`

### Default Shell
The default shell for all users is changed to `fish`.

### Custom Programs
LemOS has custom programs built specifically for this OS, for various reaons:
1. Programs that better follow the Unix philosophy.
2. Programs that would easier to condense into a single command than an alias.

#### Custom Programs Added
- To Add: `aptb`
- `DTar` (To Do: Add Link)

### To Do:
- Customized OS Flags, decouple from Debian
- Custom Theme
- Make idle time before system goes to sleep much longer
- Reorganize the Taskbar (Add and Remove Programs)
- Set Default Browser To Brave