![Screenshot_2024-10-07-23-34-21_](https://github.com/user-attachments/assets/0cd1f344-7857-48c5-adb9-62894d24eecb)

<h1 align="center"> Yurihikari's Garuda Linux Dotfiles </h1>


<p align="center">
  <a href="https://github.com/yurihikari/garuda-sway-config/stargazers"><img src="https://img.shields.io/github/stars/yurihikari/garuda-sway-config?color=f5bde6&style=for-the-badge&logo=starship"></a>
  <a href="https://github.com/yurihikari/garuda-sway-config/issues"><img src="https://img.shields.io/github/issues/yurihikari/garuda-sway-config?color=ed8796&style=for-the-badge&logo=codecov"></a>
  <a href="https://github.com/yurihikari/garuda-sway-config/network/members"><img src="https://img.shields.io/github/forks/yurihikari/garuda-sway-config?color=8aadf4&style=for-the-badge&logo=jfrog-bintray"></a>
  <a href="https://github.com/yurihikari/garuda-sway-config/blob/master/LICENSE"><img src="https://img.shields.io/badge/license-MIT-orange.svg?color=a6da95&style=for-the-badge&logo=mitsubishi"></a>
</p>

## Wiki 📖
**I NO LONGER MAINTAIN THE SWAY DOTFILES**

Here is the wiki link for those dotfiles if you want a better understanding of how it works and how to use it. (Also better table of contents). Let me know if the wiki is down since i'm self-hosting it.

Wiki : [Wiki Link](https://dotfiledocs.lightcrimson.com/)

You can also use the github wiki : [Github Wiki Link](https://github.com/yurihikari/garuda-hyprdots/wiki)

## About ❓
A simple aesthetic (at least for me) sway ricing on Garuda Linux. It also includes a Hyprland config but you'll have to install Hyprland yourself to use it.
I edited ArchCraft dotfiles for Hyprland for my base rice. I changed most of the colors and the waybar is the same as in my Sway ricing.

The aim of this repository is to provide a simple and easy to use ricing for Garuda Linux Sway and Hyprland. This was made before the official Garuda Linux Hyprland release.

I Love Catpuccin colors.

## Additional features 👍
- Waybar themes switch
- Background switch using Meta+Shift+b. (Backgrounds must be in the ~/.config/backgrounds folder)
- Easily add musics to mpd with the mpd_update function ( Assuming your musics are in ~/Music )

## Important Dependencies ⚠️
I use some apps not pre-included in the default Garuda Linux desktop. Please install them before using my dotfiles
to avoid any potential graphical issues.
- swaylock-effects (https://github.com/mortie/swaylock-effects)
- hyprlock-git
- rofi-wayland (https://github.com/lbonn/rofi) *using wofi by default on sway*
- waybar
- fastfetch
- cava-git
- foot
- hyprland (optional, if you don't want to use it, just remove the hypr folder)
- mpd
- mpc
- rose-pine-cursor
- rose-pine-hyprcursor
- ttf-font-awesome
- nerd-fonts (I installed them all by default)
- hyprpicker
- pipewire (who still uses pulseaudio on a wayland setup ?)
- wireplumber
- nwg-launchers
- mako
- most
- pavucontrol
- swayfx (if you just want sway, comment the swayfx line in the sway/config file)
- bluez
- bluez-utils
- grimblast
- gpu-screen-recorder
- btop
- networkmanager
- matugen
- wl-clipboard
- swww
- dart-sass
- brightnessctl
- gnome-bluetooth-3.0
- aylurs-gtk-shell
- micro
- blueberry
- kitty

Dependency List :
```bash
paru -S swaylock-effects hyprlock-git rofi-wayland waybar fastfetch cava-git foot hyprland-git mpd mpc rose-pine-cursor rose-pine-hyprcursor ttf-font-awesome nerd-fonts hyprpicker pipewire wireplumber nwg-launchers mako most pavucontrol swayfx bluez bluez-utils grimblast gpu-screen-recorder btop networkmanager matugen wl-clipboard swww dart-sass brightnessctl gnome-bluetooth-3.0 aylurs-gtk-shell micro blueberry kitty
```

**I didn't include personal apps like Youtube Music, Discord, VSCode and themes used in Brave etc. I can start adding them if more people ask me to.**

## Installation 🔧
### Ctrl+C Ctrl+V 😏
You'll need to install the dependencies yourself.
After you installed the dependencies (some may be missing depending of your distro), just clone the repository and copy/paste the files in the .config directory :

*Example* :
```bash
git clone https://github.com/yurihikari/garuda-sway-config.git
cp -r garuda-sway-config/* ~/.config
```

Or simply pick what you need from the files, and use it in your own.

For the nwgbar icons, you can use the included script to install them (install.sh inside the nwgbar-icons folder)

Reboot and enjoy.

### Install Script ✈️
**Disclaimer** : This was only tested on fresh Garuda Linux installs and EndeavorOs using community sway edition. I am not responsible for any damage the script may cause, even though it's unlikely.
Run the **install.sh** script located at the root of the repository directory to install the dotfiles and its dependencies.

```bash
git clone https://github.com/yurihikari/garuda-sway-config.git
cd ./garuda-sway-config
./install.sh
# You'll have some interactions sometime, it's not fully automatized
```

Reboot and enjoy.

This will work assuming you already have a working Desktop Environment. If you don't, make sure you install Sway/Hyprland first using official methods. I'll probably make a script to install Sway/Hyprland and the dotfiles on barebones Arch Linux Distro based installs later if I have the time.

Feel free to contribute and make a pull request if you want to add something to the script, or create your own script.

## Keybinds ⌨️

### Hyprland
Please, refer to this file : [Hyprland Cheatsheet](https://dotfiledocs.lightcrimson.com/en/keybinds)
Or use Meta+Shift+I to get a keybind sheet directly on your terminal.

## Waybar 📊
Swap between each version of the waybar using the paintbrush icon on the bar.
Shortcut is unavailable in Hyprland for now.

### Backgroundless Waybar ⬜
![image](https://github.com/user-attachments/assets/643d7949-6968-4c43-9c99-869583e84704)

### Background Waybar ⬛
![image](https://github.com/user-attachments/assets/995b9496-ef2d-444f-8572-e7f51f71d2f2)

## Colors 🖌️
I'm using primarly Catppuccin Macchiato as my color palette. They also have lot of themes and tutorials
to install their theme and color palette into your favorite apps.
https://github.com/catppuccin

## Background Image 🖼️
DEFAULT : Using mainly March 7th Wallpaper
https://www.pixiv.net/en/artworks/97911234 ( Artist : Rafa )

Put in the ~/.config/backgrounds whatever background you want, and do Meta+Shift+b to switch between backgrounds.

## Notice 📓
I am using **Garuda Linux Sway** as my distro. Depending on your system, some stuff may not work or break.
Please be aware of that before starting using my dotfiles.

This is a work in permanent progress, some stuff may change drastically depending on my mood and taste.
I'll make different branches if i have to massively change the behavior of the current files so you can
keep track of the previous work versions.

I am not affiliated in any way to the official Garuda Linux Team. This is a personal ricing using Garuda Linux Sway as the main distro.

## Overview 🖼️
![Screenshot_2024-10-07-23-36-37_](https://github.com/user-attachments/assets/51481283-3d84-495a-8844-76d381acdd84)
![Screenshot_2024-10-07-23-21-34_](https://github.com/user-attachments/assets/21abea54-49fb-4d7f-976d-7676163d4335)
![Screenshot_2024-10-07-23-22-13_12179](https://github.com/user-attachments/assets/97dad12f-5c2c-45ea-905d-4303e3f35bc3)

### Old
![image](https://github.com/yurihikari/garuda-sway-config/assets/83579522/a5153162-3cb7-4dfd-9975-466c5d2753b5)
![image](https://github.com/yurihikari/garuda-sway-config/assets/83579522/46e58986-51dd-477e-8289-bc4a4c429926)
![Screenshot_2024-03-27-00-04-26_](https://github.com/yurihikari/garuda-sway-config/assets/83579522/b950a49a-d7b1-4e8d-a40a-9a50d5968439)
![image](https://github.com/yurihikari/garuda-sway-config/assets/83579522/0f8c82d2-2959-4538-b16c-8cac1d8aee59)
![image](https://github.com/yurihikari/garuda-sway-config/assets/83579522/38fa971c-cc00-4e0a-a645-1b39ba7f9615)
![image](https://github.com/yurihikari/garuda-sway-config/assets/83579522/99ae3f0a-6976-4a17-b8eb-caabea3ba3de)

## Special Thanks 🙏

- [Garuda Linux](https://garudalinux.org/) for the amazing distro and base config.
- [Hyprpanel (Jas-SinghFSU)](https://github.com/Jas-SinghFSU/HyprPanel) for the AGS config.
- [Archcraft](https://archcraft.io/) for the base Hyprland config and inspiration.
- [Catppuccin](https://github.com/catppuccin/catppuccin) for their amazing color palette.

