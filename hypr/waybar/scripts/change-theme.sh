#!/bin/bash

# Set the path to the themes directory
themes_dir="${HOME}/.config/hypr/waybar/themes"
config_file="${HOME}/.config/hypr/waybar/config.jsonc"
style_file="${HOME}/.config/hypr/waybar/style.css"

# Function to display the available themes in a nicely formatted menu
display_menu() {
  echo "Available themes (.config/hypr/waybar/themes):"
  echo "--------------------------------------"
  local i=1
  for theme in "${themes_dir}"/*; do
    theme_name=$(basename "$theme")
    # Skip the 'common' directory
    if [ "$theme_name" != "common" ]; then
      echo "$i) $theme_name"
      themes_list[i]="$theme_name"
      ((i++))
    fi
  done
  echo "--------------------------------------"
  echo "Please select a theme by entering the corresponding number:"
}

# Launch Alacritty terminal with the theme selection menu
alacritty -e bash -c '
  themes_dir="'$themes_dir'"
  config_file="'$config_file'"
  style_file="'$style_file'"

  display_menu() {
    echo "Available themes (.config/hypr/waybar/themes):"
    echo "--------------------------------------"
    local i=1
    for theme in "${themes_dir}"/*; do
      theme_name=$(basename "$theme")
      if [ "$theme_name" != "common" ]; then
        echo "$i) $theme_name"
        themes_list[i]="$theme_name"
        ((i++))
      fi
    done
    echo "--------------------------------------"
    echo "Please select a theme by entering the corresponding number:"
  }

  # Call the display menu function
  display_menu

  # Read user input
  read -r theme_choice

  # Check if input is valid
  if [[ ! "$theme_choice" =~ ^[0-9]+$ ]] || [ "$theme_choice" -lt 1 ] || [ "$theme_choice" -ge "${#themes_list[@]}" ]]; then
    echo "Invalid choice. Exiting."
    exit 1
  fi

  # Set the selected theme based on user input
  selected_theme="${themes_list[theme_choice]}"
  theme_dir="${themes_dir}/$selected_theme"

  theme_config="${theme_dir}/config.jsonc"
  theme_style="${theme_dir}/style.css"

  if [ ! -f "$theme_config" ] || [ ! -f "$theme_style" ]; then
    echo "Error: Theme files not found for $selected_theme. Exiting."
    exit 1
  fi

  # Apply the selected theme
  cp "$theme_config" "$config_file"
  cp "$theme_style" "$style_file"

  echo "Theme $selected_theme applied successfully!"
'

# Restart waybar
pkill waybar
~/.config/hypr/scripts/statusbar &
