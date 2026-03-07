#!/bin/sh

# RAM usage via vm_stat
PAGE_SIZE=$(pagesize)
VM=$(vm_stat)
PAGES_USED=$(echo "$VM" | awk '
  /Pages active/    { active=$3 }
  /Pages wired/     { wired=$4 }
  /Pages compressed/{ compressed=$3 }
  END { gsub(/\./,"",active); gsub(/\./,"",wired); gsub(/\./,"",compressed)
        print active + wired + compressed }
')
PAGES_TOTAL=$(sysctl -n hw.memsize)
TOTAL_MB=$((PAGES_TOTAL / 1024 / 1024))
USED_MB=$(( (PAGES_USED * PAGE_SIZE) / 1024 / 1024 ))
PCT=$(( USED_MB * 100 / TOTAL_MB ))

USED_GB=$(echo "scale=1; $USED_MB / 1024" | bc)

if [ "$PCT" -ge 90 ]; then
  COLOR=0xffc14a4a
elif [ "$PCT" -ge 70 ]; then
  COLOR=0xffe78a4e
else
  COLOR=0xffd4be98
fi

sketchybar --set "$NAME" label="${USED_GB}G (${PCT}%)" label.color="$COLOR"
