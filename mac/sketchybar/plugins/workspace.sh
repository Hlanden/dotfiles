#!/bin/sh

WS="${NAME#space.}"

# On initial load AEROSPACE_FOCUSED_WORKSPACE is not set; query AeroSpace directly
FOCUSED="${AEROSPACE_FOCUSED_WORKSPACE:-$(/opt/homebrew/bin/aerospace list-workspaces --focused 2>/dev/null)}"

if [ "$WS" = "$FOCUSED" ]; then
  sketchybar --set "$NAME" \
    icon.color=0xff1d2021 \
    background.drawing=on \
    background.color=0xffddc7a1 \
    background.corner_radius=4 \
    background.height=22
else
  sketchybar --set "$NAME" \
    icon.color=0xff7c6f64 \
    background.drawing=off
fi
