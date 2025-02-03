#!/bin/bash

# Get the current layout
current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')

# Toggle between layouts
if [ "$current_layout" == "us" ]; then
    setxkbmap no_mod
    setxkbmap -option
else
    setxkbmap us
    setxkbmap -option
fi

