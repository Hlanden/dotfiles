#!/bin/sh
# xrandr --output DVI-I-1 --auto --rotate normal --pos 0x0 --output DVI-D-0 --primary --auto --rotate normal --right-of DVI-I-1 --output HDMI-0 --rotate right --right-of DVI-D-0
xrandr --output DP-2.1  --auto --primary --output DP-4 --auto --right-of DP-2.1
# xrandr --output DVI-D-0 --primary --auto --rotate normal --right-of DVI-I-1 --output HDMI-0 --rotate right --right-of DVI-D-0
sleep 1
picom -b --config ~/.config/picom/picom.conf &
feh --randomize --bg-fill ~/Pictures/my_wallpapers/* &
