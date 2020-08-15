#!/bin/sh

option=$(echo -e "Only Internal\nOnly External\nExtended" | dmenu)
ret=$?

if [[ $ret -eq 0 ]]
then
	if [[ $option == "Extended" ]]
	then
		mons -e right
		feh --bg-scale /home/betcke/backgrounds/wallpaper.jpg /home/betcke/backgrounds/wallpaper.jpg
	elif [[ $option == "Only External" ]]
	then
		mons -s
		feh --bg-scale /home/betcke/backgrounds/wallpaper.jpg
	elif [[ $option == "Only Internal" ]]
	then
		mons -o
		feh --bg-scale /home/betcke/backgrounds/wallpaper.jpg
	fi
fi




