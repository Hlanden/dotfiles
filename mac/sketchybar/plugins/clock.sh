#!/bin/sh

case "$1" in
  date) sketchybar --set "$NAME" label="$(date '+%a %d %b')" ;;
  time) sketchybar --set "$NAME" label="$(date '+%H:%M')" ;;
  *)    sketchybar --set "$NAME" label="$(date '+%a %d %b  %H:%M')" ;;
esac
