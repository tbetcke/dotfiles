#!/bin/sh

option=$(echo -e "Only Internal\nOnly External\nExtended" | dmenu -fn 'DejaVu Sans Mono-14' -b)
ret=$?

if [[ $ret -eq 0 ]]
then
	if [[ $option == "Extended" ]]
	then
		mons -e right
		feh --bg-scale /home/betcke/backgrounds/stars_planet.jpg /home/betcke/backgrounds/stars_planet.jpg
        /home/betcke/.config/polybar/launch.sh
	elif [[ $option == "Only External" ]]
	then
		mons -s
		feh --bg-scale /home/betcke/backgrounds/stars_planet.jpg
        /home/betcke/.config/polybar/launch.sh
	elif [[ $option == "Only Internal" ]]
	then
		mons -o
		feh --bg-scale /home/betcke/backgrounds/stars_planet.jpg
        /home/betcke/.config/polybar/launch.sh
	fi
fi




