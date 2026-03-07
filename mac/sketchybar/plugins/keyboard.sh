#!/bin/sh

CURRENT=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources 2>/dev/null \
  | grep "KeyboardLayout Name" | sed 's/.*= "\(.*\)";/\1/' | head -1)

case "$CURRENT" in
  "Norwegian") SHORT="NO" ;;
  "U.S.")      SHORT="US" ;;
  *)           SHORT="${CURRENT:-??}" ;;
esac

if [ "$SENDER" = "mouse.clicked" ]; then
  case "$CURRENT" in
    "Norwegian")
      osascript <<'EOF'
tell application "System Events"
  tell process "SystemUIServer"
    set inputMenu to menu bar item 1 of menu bar 1 whose description is "text input"
    click inputMenu
    click menu item "U.S." of menu 1 of inputMenu
  end tell
end tell
EOF
      SHORT="US"
      ;;
    *)
      osascript <<'EOF'
tell application "System Events"
  tell process "SystemUIServer"
    set inputMenu to menu bar item 1 of menu bar 1 whose description is "text input"
    click inputMenu
    click menu item "Norwegian" of menu 1 of inputMenu
  end tell
end tell
EOF
      SHORT="NO"
      ;;
  esac
fi

sketchybar --set "$NAME" label="$SHORT"
