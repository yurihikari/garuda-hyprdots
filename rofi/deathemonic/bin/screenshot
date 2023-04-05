#!/usr/bin/env bash
rofi_command="rofi -theme $HOME/.config/rofi/config/screenshot.rasi"

time=`date +%Y-%m-%d-%I-%M-%S`
geometry=`xrandr | head -n1 | cut -d',' -f2 | tr -d '[:blank:],current'`
dir="`xdg-user-dir PICTURES`/Screenshots"
file="Screenshot_${time}_${geometry}.png"

# Icons
icon1="$HOME/.config/dunst/icons/collections.svg"
icon2="$HOME/.config/dunst/icons/timer.svg"

# Buttons
layout=`cat $HOME/.config/rofi/config/screenshot.rasi | grep BUTTON | cut -d'=' -f2 | tr -d '[:blank:],*/'`
if [[ "$layout" == "TRUE" ]]; then
	screen=""
	area=""
	window="缾"
	infive="靖"
	inten="福"
else
	screen=" Capture Desktop"
	area=" Capture Area"
	window="缾 Capture Window"
	infive="靖 Take in 3s"
	inten="福 Take in 10s"
fi

# Notify and view screenshot
notify_view () {
	dunstify -u low --replace=699 -i $icon1 "Copied to clipboard."
	viewnior ${dir}/"$file"
	if [[ -e "$dir/$file" ]]; then
		dunstify -u low --replace=699 -i $icon1 "Screenshot Saved."
	else
		dunstify -u low --replace=699 -i $icon1 "Screenshot Deleted."
	fi
}

# countdown
countdown () {
	for sec in `seq $1 -1 1`; do
		dunstify -t 1000 --replace=699 -i $icon2 "Taking shot in : $sec"
		sleep 1
	done
}

# take shots
shotnow () {
	cd ${dir} && sleep 0.5 && maim -u -f png | tee "$file" | xclip -selection clipboard -t image/png
	notify_view
}

shot5 () {
	countdown '3'
	sleep 1 && cd ${dir} && maim -u -f png | tee "$file" | xclip -selection clipboard -t image/png
	notify_view
}

shot10 () {
	countdown '10'
	sleep 1 && cd ${dir} && maim -u -f png | tee "$file" | xclip -selection clipboard -t image/png
	notify_view
}

shotwin () {
	cd ${dir} && maim -u -f png -i `xdotool getactivewindow` | tee "$file" | xclip -selection clipboard -t image/png
	notify_view
}

shotarea () {
	cd ${dir} && maim -u -f png -s -b 2 -c 0.35,0.55,0.85,0.25 -l | tee "$file" | xclip -selection clipboard -t image/png
	notify_view
}

if [[ ! -d "$dir" ]]; then
	mkdir -p "$dir"
fi

# Variable passed to rofi
options="$screen\n$area\n$window\n$infive\n$inten"

chosen="$(echo -e "$options" | $rofi_command -p 'Take A Shot' -dmenu -selected-row 0)"
case $chosen in
    $screen)
		shotnow
        ;;
    $area)
		shotarea
        ;;
    $window)
		shotwin
		;;
    $infive)
		shot5
		;;
    $inten)
		shot10
        ;;
esac

