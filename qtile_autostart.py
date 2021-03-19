#!/bin/sh

nitrogen --restore
picom --experimental-backends&
dunst&
pasystray&
nm-applet&
light -S 20
blueman-applet&
udiskie -at&
dropbox start
xss-lock --transfer-sleep-lock -- i3lock -n -i /home/betcke/wallpapers/default.png -t &
alacritty&





