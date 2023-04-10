#!/bin/bash

# Set the directory where the backgrounds are stored
BACKGROUND_DIR="$HOME/.config/sway/backgrounds"

# Get the list of backgrounds
BACKGROUND_LIST=("$BACKGROUND_DIR"/*)
echo "Background list: ${BACKGROUND_LIST[@]}"

# Read the Sway config line from a file
config_line=$(grep -oP "(?<=output \* bg ).*(?= fill)" ~/.config/sway/config)

# Extract the wallpaper filename and extension using basename
wallpaper=$(basename $config_line)

# Print the wallpaper filename and extension
echo $wallpaper


# Print the wallpaper filename and extension
echo "Current wallpaper : $wallpaper"
# Get the path of the current background from the sway config file
CURRENT_BACKGROUND=$HOME/.config/sway/backgrounds/$wallpaper
echo "Current background: $CURRENT_BACKGROUND"

# Find the index of the current background in the list
CURRENT_INDEX=0
for i in "${!BACKGROUND_LIST[@]}"; do
    echo "Comparing ${BACKGROUND_LIST[$i]} with $CURRENT_BACKGROUND"
    if [[ "${BACKGROUND_LIST[$i]}" == "${CURRENT_BACKGROUND}" ]]; then
        CURRENT_INDEX=$i
        echo "Current index: $CURRENT_INDEX"
        break
    fi
done

# Calculate the index of the next background
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#BACKGROUND_LIST[@]} ))
echo "Next index: $NEXT_INDEX"

# Get the path of the next background
NEXT_BACKGROUND="${BACKGROUND_LIST[$NEXT_INDEX]}"

# Set the background to the next background
swaymsg output "*" bg "$NEXT_BACKGROUND" fill

# Save the current background in the sway config file
sed -i "s|^output \* bg.*|output \* bg $NEXT_BACKGROUND fill|" "$HOME/.config/sway/config"
