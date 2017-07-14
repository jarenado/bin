#!/bin/bash
while true
do
    image=$(shuf -n1 -e ~/.config/i3/Wallpapers/*)
    feh --bg-scale $image
    sleep 300 # 300 seconds or 5 minutes
done
