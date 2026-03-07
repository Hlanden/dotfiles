#!/bin/sh

# Check for active VPN via scutil — works for built-in macOS VPN and most others
VPN=$(scutil --nc list 2>/dev/null | grep -i connected | head -1 | sed 's/.*"\(.*\)".*/\1/')

if [ -n "$VPN" ]; then
  sketchybar --set "$NAME" \
    icon.color=0xffa9b665 \
    label="$VPN" \
    label.drawing=on \
    drawing=on
else
  # Hide entirely when no VPN active
  sketchybar --set "$NAME" drawing=off
fi
