#!/bin/zsh

# TODO: Add help script and primary screen as input arg

# Check conencted displays
primary_screen="DP-4"
connected_displays=$(xrandr | grep -w connected)
num_monitors=$(echo "$connected_displays" | wc -l)

# AWK script to extract the highest resolution for 
#   all connected monitors
displays_max_resolution=$(xrandr | awk '
/connected/ && !/disconnected/ {
display = $1
    max_width[display] = 0
    max_height[display] = 0
    next
  }
  display && /[0-9]+x[0-9]+/ {
    split($1, dimensions, "x")
    width = dimensions[1]
    height = dimensions[2]
    if (width > max_width[display]) {
      max_width[display] = width
      max_height[display] = height
    }
  }
  END {
    for (display in max_width) {
      print display, max_width[display] "x" max_height[display]
    }
  }
  ')
echo $displays_max_resolution
# set up the screens to their highest resolution
while read -r line; do
  display_name=$(echo "$line" | awk '{print $1}')
  resolution=$(echo "$line" | awk '{print $2}')

  if [ $display_name = $primary_screen ]; then 
      xrandr --output $display_name  --auto --mode $resolution --primary 
  else
      xrandr --output $display_name  --auto --mode $resolution --right-of $primary_screen
  fi
done <<< $displays_max_resolution
