#!/bin/bash

zscroll -l 20 \ # the length of the text window that is scrolled
        --delay 0.3 \ # the scroll delay 
		    --update-check true '/home/prayag_s/.config/polybar/scripts/get_spotify_status.sh' &

wait