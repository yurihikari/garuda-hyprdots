#!/usr/bin/env bash

# Author: Srm-Akla
# This script copies the theme files and config file and places them in proper folder

_rofi="$HOME/.config/rofi"
_theme="$HOME/.local/share/rofi/themes"

if [[ ! -d "$_rofi" || ! -d "$_theme" ]]; then
    mkdir -p "$_rofi" "$_theme"
else
    mkdir -p "$_rofi/userconfig/"
    mv "$_rofi/config.rasi" "$_rofi/userconfig/"
fi

cp -r "$PWD"/.config/rofi/* "$_rofi"
cp -r "$PWD"/.local/share/rofi/themes/* "$_theme"


