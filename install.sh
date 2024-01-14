#!/bin/bash

# Get this script directory 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Get distro name
distro=$(cat /etc/os-release | grep -w "NAME" | cut -d "=" -f2 | tr -d '"')

# If the distro is Garuda Linux, update the system using update command, else use pacman
echo "Updating system"
if [ "$distro" == "Garuda Linux" ]; then
  echo "Detected Garuda Linux, updating system..."
  update
else
  echo "Not Garuda Linux, updating system using pacman..."
  sudo pacman -Syu --noconfirm
fi

# Install paru
sudo pacman -S paru --noconfirm

# Function to check if a package is installed, if not, install it using paru
function install {
  if ! pacman -Qi $1 &> /dev/null; then
    echo "Installing $1..."
    paru -S $1 --noconfirm
  else
    echo "$1 is already installed. Skipping..."
  fi
}

# Add chaotic AUR keys and repository if not added, else skip
echo "Adding chaotic AUR keys and repository"
if ! pacman-key --list-keys chaotic-aur &> /dev/null; then
  echo "Adding chaotic AUR keys and repository"
  sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  sudo pacman-key --lsign-key 3056513887B78AEB
  sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
  echo "Chaotic AUR keys added successfully"
else 
  echo "Chaotic AUR keys and repository already added. Skipping..."
fi

# Add chaotic AUR
if ! grep -q "^\[chaotic-aur\]" /etc/pacman.conf; then
  echo "[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
  sudo pacman -Sy
  echo "Chaotic AUR repository added/updated successfully"
fi

# Install dependencies using the install function
# Make an array of all the dependencies (swaylock-effects rofi-lbonn-wayland waybar-git neofetch cava foot hyprland-git mpd mpc sweet-cursor-theme-git ttf-font-awesome nerd-fonts hyprpicker pipewire wireplumber fish)
echo "Installing dependencies"
dependencies=(
  swaylock-effects 
  rofi-lbonn-wayland 
  waybar-git neofetch 
  cava 
  foot 
  hyprland-git 
  mpd 
  mpc 
  sweet-cursor-theme-git 
  ttf-font-awesome 
  nerd-fonts 
  hyprpicker 
  pipewire 
  wireplumber 
  fish
)

# Loop through the array and install all the dependencies
for i in "${dependencies[@]}"; do
  install $i
done

echo "Dependencies installed successfully"

# Uninstall wlsunset if installed (yes, i hate it)
echo "Uninstalling wlsunset"
if pacman -Qi wlsunset &> /dev/null; then
  sudo pacman -R wlsunset --noconfirm
fi

# Place the files from garuda-sway-config (where this script is located) inside the .config folder
echo "Copying files from garuda-sway-config to ~/.config"
cp -r $DIR/* ~/.config

# Copy nwgbar icons into corresponding folder
echo "Copying nwgbar icons into /usr/share/nwg-launchers/nwgbar/images"
sudo cp -r ~/.config/nwgbar-icons /usr/share/nwg-launchers/nwgbar/images

# Delete Git-related folders and specific files
echo "Deleting Git-related folders"
rm -rf ~/.config/.git ~/.config/.github
echo "Deleting not required files"
rm -f ~/.config/LICENSE ~/.config/.gitignore ~/.config/README.md ~/.config/install.sh

# Ask if the user wants to reboot the system now or not
echo "Do you want to reboot the system now? (y/n)"
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
  echo "Installation completed successfully. Rebooting in 2 seconds..."
  # Wait for 2s before rebooting 
  sleep 2
  sudo reboot now
else
  echo "Installation completed successfully. Please reboot your system to apply the changes."
fi

