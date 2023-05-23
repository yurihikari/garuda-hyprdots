#!/usr/bin/env bash

## Copyright (C) 2020-2023 Aditya Shakya <adi1090x@gmail.com>
##
## launch terminal with alt config

CONFIG="$HOME/.config/hypr/foot/foot.ini"

if [ "$1" == "-f" ]; then
	foot --app-id='foot-float' --config="$CONFIG"
elif [ "$1" == "-F" ]; then
	foot --fullscreen --app-id='foot-full' --font="Iosevka Nerd Font:size=14" --override=pad=35x35 --config="$CONFIG"
elif [ "$1" == "-s" ]; then
	foot --app-id='foot-float' --config="$CONFIG" \
	--window-size-pixels=$(slurp -b 20262CCC -c B4A1DBff -s B4A1DB0D -w 2 -f "%wx%h")
else
	foot --config="$CONFIG"
fi
