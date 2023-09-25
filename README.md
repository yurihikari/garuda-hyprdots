# Garuda Linux Sway and Hyprland Ricing by yurihikari

A simple aesthetic (at least for me) sway ricing on Garuda Linux. It also includes a Hyprland config but you'll have to install Hyprland yourself to use it.
I edited ArchCraft dotfiles for Hyprland for my base rice. I changed most of the colors and the waybar is the same as in my Sway ricing.

## Overview
![image](https://github.com/yurihikari/garuda-sway-config/assets/83579522/04e410bd-520c-4371-a166-b370d54e319d)
![image](https://github.com/yurihikari/garuda-sway-config/assets/83579522/f2e26753-fe60-4395-bad0-b321a3a08481)
![image](https://github.com/yurihikari/garuda-sway-config/assets/83579522/0f8c82d2-2959-4538-b16c-8cac1d8aee59)
![image](https://github.com/yurihikari/garuda-sway-config/assets/83579522/38fa971c-cc00-4e0a-a645-1b39ba7f9615)
![image](https://github.com/yurihikari/garuda-sway-config/assets/83579522/c6451032-4053-4ae9-a47f-f47c1df09a4b)
![image](https://github.com/yurihikari/garuda-sway-config/assets/83579522/92bfc092-ce88-47d7-a9bd-b3b0d6a396ff)

Both Sway and Hyprland are almost identical, except Hyprland having rounded app borders and smooth animations.

## Additional features
- Waybar background toggling button (Meta+Shift+w also works)
- Background switch using Meta+Shift+b. (Backgrounds must be in the ~/.config/sway/backgrounds folder
- Hyprland Config
- Easily add musics to mpd with the mpd_update function ( Assuming your musics are in ~/Music )

## Important Dependencies
I use some apps not pre-included in the default Garuda Linux desktop. Please install them before using my dotfiles
to avoid any potential graphical issues.
- swaylock-effects (https://github.com/mortie/swaylock-effects)
- rofi-lbonn-wayland (https://github.com/lbonn/rofi) *using wofi by default on sway*
- waybar-hyprland-git 
- neofetch
- cava
- foot
- hyprland-git
- mpd
- mpc
- sweet-cursor-theme-git
- ttf-font-awesome

Dependency List :
```
swaylock-effects rofi-lbonn-wayland waybar-hyprland-git neofetch cava foot hyprland-git mpd mpc sweet-cursor-theme-git ttf-font-awesome
```

I used yay to install those packages. You can use your favorite AUR helper.
**rofi-lbonn-wayland** is not mandatory, but it's a wayland compatible version of rofi. You can use wofi instead.

**I didn't include personal apps like Youtube Music, Discord, VSCode and themes used in google-chrome etc.**

## Installation
There is no installation script yet. However, you can clone this repository and copy paste its content in your .config/ folder :

*Example* :
```bash
git clone https://github.com/yurihikari/garuda-sway-config.git
cp -r garuda-sway-config/* ~/.config
```

Or simply pick what you need from the files, and use it in your own.

For the nwgbar icons, you can use the included script to install them (install.sh inside the nwgbar-icons folder)

## Keybinds

### Sway
Please, refer to this file : [Sway Cheatsheet](https://github.com/yurihikari/garuda-sway-config/blob/master/sway/cheatsheet.md)
Or use Meta+Shift+I to get a keybind sheet directly on your terminal.

### Hyprland
Please, refer to this file : [Hyprland Cheatsheet](https://github.com/yurihikari/garuda-sway-config/blob/master/hypr/cheatsheet.md)
Or use Meta+Shift+I to get a keybind sheet directly on your terminal.

## Waybar
Swap between each version of the waybar using the paintbrush icon on the bar.
Shortcut is unavailable in Hyprland for now.

### Backgroundless Waybar
![image](https://github.com/yurihikari/garuda-sway-config/assets/83579522/c996f39f-6508-4f23-b707-f7a8778f5ff4)

### Background Waybar
![image](https://github.com/yurihikari/garuda-sway-config/assets/83579522/32f7b93b-b3c1-46f9-840b-407ce1a2da6d)

## nwgbar
![image](https://github.com/yurihikari/garuda-sway-config/assets/83579522/bf02deae-1b64-4ace-b151-df30459ec464)

## Colors
I'm using primarly Catppuccin Macchiato as my color palette. They also have lot of themes and tutorials
to install their theme and color palette into your favorite apps.
https://github.com/catppuccin

## Background Image
Actually working on a script to swap between a set of wallpapers. For now, i'm using primarly this one :
https://www.pixiv.net/en/artworks/64337772 ( Artist : 焦茶 )

The artist has passed away, may he rest in peace.

EDIT : I'm now using mainly March 7th Wallpaper
https://www.pixiv.net/en/artworks/97911234 ( Artist : Rafa )

Put in the background folder located in the sway folder config whatever background you want, and do Meta+Shift+b to switch between backgrounds.

## Notice
I am using **Garuda Linux Sway** as my distro. Depending on your system, some stuff may not work or break.
Please be aware of that before starting using my dotfiles.

This is a work in permanent progress, some stuff may change drastically depending on my mood and taste.
I'll make different branches if i have to massively change the behavior of the current files so you can
keep track of the previous work versions.

I am not affiliated in any way to the official Garuda Linux Sway Team. This is a personal ricing using Garuda Linux Sway as the main distro.
