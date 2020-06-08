#!/bin/bash

zscroll -l 20 \ # the length of the text window that is scrolled
        --delay 0.3 \ # the scroll delay
        # see man zscroll for documentation of the following commands
        --match-command "playerctl status spotify" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true '/home/prayag_s/.config/polybar/scripts/get_spotify_status.sh' &

wait