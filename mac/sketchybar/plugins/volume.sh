#!/bin/sh

get_volume() {
  osascript -e 'output volume of (get volume settings)'
}

get_muted() {
  osascript -e 'output muted of (get volume settings)'
}

update_display() {
  VOLUME=$(get_volume)
  MUTED=$(get_muted)

  if [ "$MUTED" = "true" ]; then
    sketchybar --set "$NAME" icon="󰖁" label="muted"
    return
  fi

  case "$VOLUME" in
    [6-9][0-9]|100) ICON="󰕾" ;;
    [3-5][0-9])     ICON="󰖀" ;;
    [1-9]|[1-2][0-9]) ICON="󰕿" ;;
    *)               ICON="󰖁" ;;
  esac

  sketchybar --set "$NAME" icon="$ICON" label="${VOLUME}%"
}

case "$SENDER" in
  mouse.clicked)
    MUTED=$(get_muted)
    if [ "$MUTED" = "true" ]; then
      osascript -e 'set volume without output muted'
    else
      osascript -e 'set volume with output muted'
    fi
    update_display
    ;;
  mouse.scrolled)
    if [ "${SCROLL_DELTA%.*}" -gt 0 ] 2>/dev/null; then
      osascript -e 'set volume output volume (output volume of (get volume settings)) + 5'
    else
      osascript -e 'set volume output volume (output volume of (get volume settings)) - 5'
    fi
    update_display
    ;;
  *)
    update_display
    ;;
esac
