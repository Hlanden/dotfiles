#!/bin/sh

# Try Spotify first, then Music app
SPOTIFY_STATE=$(osascript -e 'if application "Spotify" is running then return player state of application "Spotify"' 2>/dev/null)
MUSIC_STATE=$(osascript -e 'if application "Music" is running then return player state of application "Music"' 2>/dev/null)

if [ "$SPOTIFY_STATE" = "playing" ]; then
  TRACK=$(osascript -e 'tell application "Spotify" to return name of current track' 2>/dev/null)
  ARTIST=$(osascript -e 'tell application "Spotify" to return artist of current track' 2>/dev/null)
  LABEL="$ARTIST - $TRACK"
elif [ "$MUSIC_STATE" = "playing" ]; then
  TRACK=$(osascript -e 'tell application "Music" to return name of current track' 2>/dev/null)
  ARTIST=$(osascript -e 'tell application "Music" to return artist of current track' 2>/dev/null)
  LABEL="$ARTIST - $TRACK"
else
  sketchybar --set "$NAME" drawing=off
  exit 0
fi

# Truncate handled by label.max_chars in sketchybarrc
sketchybar --set "$NAME" drawing=on label="$LABEL"
