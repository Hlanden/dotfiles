#!/bin/sh

# CPU usage via top (average of all cores, one sample)
CPU=$(top -l 1 -s 0 | awk '/CPU usage/ {gsub(/%/,""); print int($3 + $5)}')

if [ "$CPU" -ge 90 ]; then
  COLOR=0xffc14a4a
elif [ "$CPU" -ge 70 ]; then
  COLOR=0xffe78a4e
else
  COLOR=0xffd4be98
fi

sketchybar --set "$NAME" label="${CPU}%" label.color="$COLOR"
