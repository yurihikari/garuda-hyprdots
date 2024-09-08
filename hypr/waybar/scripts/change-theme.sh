#!/bin/bash

# Set the path to the themes directory
themes_dir="${HOME}/.config/hypr/waybar/themes"
config_file="${HOME}/.config/hypr/waybar/config.jsonc"
style_file="${HOME}/.config/hypr/waybar/style.css"

# Get list of themes excluding 'common'
themes_list=()
for theme in "${themes_dir}"/*; do
  theme_name=$(basename "$theme")
  if [ "$theme_name" != "common" ]; then
    themes_list+=("$theme_name")
  fi
done

# Prepare the theme list in a format suitable for Yad --list
themes_string=$(printf "%s\n" "${themes_list[@]}")

# Display the theme selection dialog using Yad and capture both output and exit status
selected_theme=$(echo "$themes_string" | yad --list --title="Select a Theme" \
  --column="Themes" --height=300 --width=400 --button=Cancel:1 --button=Apply:0)

# Capture the exit status of Yad
response=$?

# If the user clicks Cancel (exit status 1), exit the script
if [ $response -eq 1 ]; then
  exit 1
fi

# Trim any leading/trailing spaces and remove the | separator if any
selected_theme=$(echo "$selected_theme" | sed 's/|.*//')

# If no theme is selected, exit
if [ -z "$selected_theme" ]; then
  exit 1
fi

# Set the selected theme directory and config/style file paths
theme_dir="${themes_dir}/$selected_theme"
theme_config="${theme_dir}/config.jsonc"
theme_style="${theme_dir}/style.css"

# Check if the selected theme files exist
if [ ! -f "$theme_config" ] || [ ! -f "$theme_style" ]; then
  exit 1
fi

# Apply the selected theme
cp "$theme_config" "$config_file"
cp "$theme_style" "$style_file"

# Restart waybar
pkill waybar
~/.config/hypr/scripts/statusbar &
