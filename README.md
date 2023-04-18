# Garuda Linux Sway Ricing by yurihikari

A simple aesthetic (at least for me) sway ricing on Garuda Linux.

## Additional features
- Waybar background toggling button (Meta+Shift+w also works)
- Background switch using Meta+Shift+b. (Backgrounds must be in the ~/.config/sway/backgrounds folder

## Important Dependencies
I use some apps not pre-included in the default Garuda Linux desktop. Please install them before using my dotfiles
to avoid any potential graphical issues.
- swaylock-effects (https://github.com/mortie/swaylock-effects)
- ~~rofi-lbonn-wayland (https://github.com/lbonn/rofi)~~ using wofi by default
- neofetch
- cava

**I didn't included personal apps like Youtube Music, Discord, VSCode and themes used in google-chrome etc.**

## Installation
There is no installation script yet. However, you can clone this repository and copy paste its content in your .config/ folder :

*Example* :
```bash
git clone https://github.com/yurihikari/garuda-sway-config.git
cp -r /garuda-sway-config/* ~/.config
```

Or simply pick what you need from the files, and use it in your own.

For the nwgbar icons, you can use the included script to install them (install.sh inside the nwgbar-icons folder)

## Keybinds
Please, refer to this file : https://github.com/yurihikari/garuda-sway-config/blob/c7fafa6c425014971525b5ff9bbf66f1facad5b4/sway/cheatsheet.md
Or use Meta+Shift+I to get a keybind sheet directly on your terminal.

## Waybar
Swap between each version of the waybar using the paintbrush icon on the bar.

### Backgroundless Waybar
![image](https://user-images.githubusercontent.com/83579522/232345761-7f57e38a-0a3a-45ad-93f5-6e07bec0e4c6.png)

### Background Waybar
![image](https://user-images.githubusercontent.com/83579522/232345726-ab08a847-fd88-4e23-8006-9b465121a64c.png)

## Colors
I'm using primarly Catppuccin Macchiato as my color palette. They also have lot of themes and tutorials
to install their theme and color palette into your favorite apps.
https://github.com/catppuccin

## Background Image
![image](https://user-images.githubusercontent.com/83579522/230727420-142e2e36-8b7d-42fa-8571-cbb3eb2787fe.png)

Actually working on a script to swap between a set of wallpapers. For now, i'm using primarly this one :
https://www.pixiv.net/en/artworks/64337772 ( Artist : 焦茶 )

The artist has passed away, may he rest in peace.

## Notice
I am using **Garuda Linux Sway** as my distro. Depending on your system, some stuff may not work or break.
Please be aware of that before starting using my dotfiles.

This is a work in permanent progress, some stuff may change drastically depending on my mood and taste.
I'll make different branches if i have to massively change the behavior of the current files so you can
keep track of the previous work versions.

I am not affiliated in any way to the official Garuda Linux Sway Team. This is a personal ricing using Garuda Linux Sway as the main distro.
