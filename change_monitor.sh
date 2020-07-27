#!/bin/sh

option=$(echo -e "Internal\nOnly external\nExtended" | rofi -dmenu)
ret=$?

if [[ $ret -eq 0 ]]
then
	if [[ $option == "Extended" ]]
	then
		mons -e right
		feh --bg-scale /home/betcke/backgrounds/wallpaper.jpg /home/betcke/backgrounds/wallpaper.jpg
	elif [[ $option == "Only external" ]]
	then
		mons -s
		feh --bg-scale /home/betcke/backgrounds/wallpaper.jpg
	elif [[ $option == "Internal" ]]
	then
		mons -o
		feh --bg-scale /home/betcke/backgrounds/wallpaper.jpg
	fi
fi




