#!/bin/sh

# If called with "click" argument, toggle mute
if [ "$1" = "click" ]; then
  MUTED=$(osascript -e 'input volume of (get volume settings)')
  if [ "$MUTED" = "0" ]; then
    osascript -e 'set volume input volume 50'
  else
    osascript -e 'set volume input volume 0'
  fi
fi

MIC_VOL=$(osascript -e 'input volume of (get volume settings)')

if [ "$MIC_VOL" = "0" ]; then
  # Muted — show red mic icon
  sketchybar --set "$NAME" \
    icon="󰍭" \
    icon.color=0xffc14a4a \
    drawing=on
else
  # Active — show dim mic icon (subtle, not alarming)
  sketchybar --set "$NAME" \
    icon="󰍬" \
    icon.color=0xff7c6f64 \
    drawing=on
fi
