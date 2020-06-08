#!/bin/bash

if [ "$(playerctl status spotify)" = "Stopped" ]; then
    echo "No music is playing"
else # Can be configured to output differently when player is paused
    playerctl metadata spotify --format "{{ title }} - {{ artist }}"
fi
