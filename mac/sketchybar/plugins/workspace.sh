#!/bin/sh

WS="${NAME#space.}"

if [ "$WS" = "$AEROSPACE_FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" icon.color=0xffddc7a1
else
  sketchybar --set "$NAME" icon.color=0xff7c6f64
fi
