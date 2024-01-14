#!/bin/bash

# Function to check if a command is installed
check_command() {
  command -v "$1" >/dev/null 2>&1 || { echo >&2 "$1 is required but not installed."; }
}

# Function to install a package if it's not already installed
install_package() {
  if ! check_command "$1"; then
    echo "Installing $1..."
    sudo pacman -S --noconfirm "$1"
  fi
}

# Update system
update_command="update"
check_command "$update_command"

# Install paru if not installed
install_package "paru"

# Add chaotic AUR keys and repository
check_command "pacman-key"
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# Add chaotic AUR
if ! grep -q "^\[chaotic-aur\]" /etc/pacman.conf; then
  echo "[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
  sudo pacman -Sy
fi

# Install dependencies with paru
install_package "swaylock-effects"
install_package "rofi-lbonn-wayland"
install_package "waybar-git"
install_package "neofetch"
install_package "cava"
install_package "foot"
install_package "hyprland-git"
install_package "mpd"
install_package "mpc"
install_package "sweet-cursor-theme-git"
install_package "ttf-font-awesome"
install_package "nerd-fonts"
install_package "hyprpicker"

# Uninstall wlsunset if installed (Read mode which can't be disabled sometimes)
sudo pacman -Rns wlsunset

# Clone the repository
git clone https://github.com/yurihikari/garuda-sway-config.git

# Place the files inside the .config folder
cp -r garuda-sway-config/* ~/.config

# Copy nwgbar icons into corresponding folder
sudo cp -r ~/.config/nwgbar-icons /usr/share/nwg-launchers/nwgbar/images

# Delete Git-related folders and specific files
rm -rf ~/.config/.git ~/.config/.github
rm -f ~/.config/LICENSE ~/.config/.gitignore ~/.config/README.md ~/.config/install.sh

# Enable pipewire so the sound works (if not enabled)
systemctl --user enable --now pipewire.service pipewire-pulse.service

echo "Installation completed successfully."
