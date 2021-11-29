#!/bin/sh
xrandr --output DVI-I-1 --auto --rotate normal --pos 0x0 --output DVI-D-0 --primary --auto --rotate normal --right-of DVI-I-1 --output HDMI-0 --rotate right --right-of DVI-D-0
sleep 1
picom -b --config ~/.dotfiles/picom/picom.conf &
feh --randomize --bg-fill ~/Pictures/backgrounds/* &
