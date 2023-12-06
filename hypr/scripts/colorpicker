#!/usr/bin/env bash
#color=$(grim -g "`slurp -b 20262C00 -p`" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:- | tail -n1 | cut -d' ' -f4)
# color take the result of the command hyprpicker -a 
color=$(hyprpicker -a)
image=/tmp/${color}.png

main() {
	if [[ "$color" ]]; then
		# copy color code to clipboard
		echo $color | tr -d "\n" | wl-copy
		# generate preview
		convert -size 48x48 xc:"$color" ${image}
		# notify about it
		notify-send -h string:x-canonical-private-synchronous:sys-notify-picker -u low -i ${image} "$color, copied to clipboard."
	fi
}

# Run the script
main
