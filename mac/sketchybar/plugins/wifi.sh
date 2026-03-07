#!/bin/sh

SSID=$(networksetup -getairportnetwork en1 2>/dev/null | sed 's/Current Wi-Fi Network: //')

if [ -z "$SSID" ] || echo "$SSID" | grep -q "not associated\|Error"; then
  sketchybar --set "$NAME" icon="󰤭" label="" icon.color=0xff7c6f64
else
  sketchybar --set "$NAME" icon="󰤨" label="$SSID" icon.color=0xff7c6f64
fi
