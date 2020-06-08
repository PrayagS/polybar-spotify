#!/bin/bash

if [ "$(playerctl status spotify)" = "Stopped" ]; then
    echo "No music is playing"
elif [ "$(playerctl status spotify)" = "Paused"  ]; then
    polybar-msg -p "$(pgrep -f "polybar bottom")" hook spotify-pause 2 >/dev/null
    playerctl metadata spotify --format "{{ title }} - {{ artist }}"
else # Can be configured to output differently when player is paused
    polybar-msg -p "$(pgrep -f "polybar bottom")" hook spotify-pause 1 > /dev/null
    playerctl metadata spotify --format "{{ title }} - {{ artist }}"
fi
