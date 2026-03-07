#!/bin/sh

APP_NAME=$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true' 2>/dev/null)

if [ -z "$APP_NAME" ]; then
  exit 0
fi

# Source the icon map and look up the glyph for this app
. "$HOME/.config/sketchybar/plugins/icon_map.sh"
__icon_map "$APP_NAME"
ICON="${icon_result:-:default:}"

sketchybar --set "$NAME" \
  icon="$ICON" \
  icon.font="sketchybar-app-font:Regular:16.0" \
  label="$APP_NAME"
