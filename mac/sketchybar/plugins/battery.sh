#!/bin/sh

PERCENTAGE=$(pmset -g batt | grep -Eo '[0-9]+%' | tr -d '%')
CHARGING=$(pmset -g batt | grep -q 'AC Power' && echo "yes" || echo "no")

if [ -z "$PERCENTAGE" ]; then
  # No battery (desktop Mac) — hide the item
  sketchybar --set "$NAME" drawing=off
  exit 0
fi

if [ "$CHARGING" = "yes" ]; then
  case "$PERCENTAGE" in
    100)        ICON="󰂅" ;;
    9[0-9])     ICON="󰂋" ;;
    [7-8][0-9]) ICON="󰂊" ;;
    [5-6][0-9]) ICON="󰢞" ;;
    [3-4][0-9]) ICON="󰂈" ;;
    [1-2][0-9]) ICON="󰂆" ;;
    *)          ICON="󰢟" ;;
  esac
  COLOR=0xffa9b665
else
  case "$PERCENTAGE" in
    9[0-9]|100) ICON="󰂂" ;;
    [7-8][0-9]) ICON="󰂁" ;;
    [5-6][0-9]) ICON="󰂀" ;;
    [3-4][0-9]) ICON="󰁾" ;;
    [1-2][0-9]) ICON="󰁼" ;;
    [6-9])      ICON="󰁺" ;;
    *)          ICON="󰂃" ;;
  esac
  if [ "$PERCENTAGE" -le 10 ]; then
    COLOR=0xffc14a4a
  elif [ "$PERCENTAGE" -le 20 ]; then
    COLOR=0xffe78a4e
  else
    COLOR=0xffd4be98
  fi
fi

sketchybar --set "$NAME" \
  drawing=on \
  icon="$ICON" \
  icon.color="$COLOR" \
  label="${PERCENTAGE}%"
