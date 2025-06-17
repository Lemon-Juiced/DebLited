# DebLited
DebLited is a script designed to transform a basic installation of Debian 12.11.0 with the GNOME Desktop Environment into a customized build of LemOS. It simplifies the setup process by automating package installation, removal, and GNOME tweaks.

## Usage
To use DebLited, follow these steps:
1. Start with a fresh Debian 12.11.0 installation with GNOME Desktop.
2. Run the `deblite.sh` script to apply the changes.

Ensure you have execution permissions for the script:

```bash
chmod +x deblite.sh
./deblite.sh
```

## Features

### Removed Packages
DebLited removes the following packages to streamline the system:

- `anthy-common`, `anthy`, `libanthy1`, `libanthyinput0`: Japanese input method packages.
- `firefox-esr`: The extended support release of Firefox.
- **Gnome Games**: A collection of pre-installed games including:
  - `aisleriot`
  - `five-or-more`
  - `four-in-a-row`
  - `gnome-2048`
  - `gnome-chess`
  - `gnome-klotski`
  - `gnome-mahjongg`
  - `gnome-mines`
  - `gnome-nibbles`
  - `gnome-robots`
  - `gnome-sudoku`
  - `gnome-tetravex`
  - `hitori`
  - `iagno`
  - `lightsoff`
  - `quadrapassel`
  - `tali`
- `goldendict`: A dictionary application.
- `hdate-applet`, `libhdate1`: Hebrew calendar applet and library.
- `mlterm`, `mlterm-common`: Multilingual terminal emulator.
- `mozc`, `ibus-mozc`, `mozc-data`, `mozc-utils-gui`, `uim-mozc`: Japanese input method packages.
- `shotwell`, `shotwell-common`: Photo management application.
- `thunderbird`: The default email client.
- `transmission-common`, `transmission-gtk`: BitTorrent client.
- `xiterm+thai`: Thai terminal emulator.


### Installed Packages
DebLited installs the following packages to enhance functionality:
- `betterbird`: An improved version of Thunderbird email client.
- `brave`: A privacy-focused web browser.
- `cmake`: A cross-platform tool for managing the build process of software.
- `fish`: A user-friendly shell with advanced features.
- `flatpak`, `gnome-software-plugin-flatpak`: A system for distributing and running sandboxed desktop applications.
- `gdb`: A powerful debugger for C and C++.
- `gnome-extensions`: An extensions platform that allows for other customizations.
- `htop`: An interactive process viewer for Unix systems.
- `neovim`: An advanced text editor for developers.
- `unzip`: A utility for extracting compressed files.

### Installed GNOME Tweaks
DebLited applies the following GNOME tweaks to improve usability:
- `arcmenu`: A customizable application menu.
- `dash-to-panel`: Combines the GNOME dash and top panel into a single panel.
- `gnome-shell-extension-appindicator`: Adds support for application indicators and status notifiers.
