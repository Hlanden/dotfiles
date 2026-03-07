#!/bin/sh

# Free disk space on /
FREE=$(df -H / | awk 'NR==2 {print $4}')
sketchybar --set "$NAME" label="${FREE} free"
