#!/bin/bash

step=3

if [[ $# -eq 1 ]]; then
  case $1 in
    "up")
      amixer set Master $step%+;;
    "down")
      amixer set Master $step%-;;
    "toggle")
      amixer set Master toggle;;
    *)
      echo "Invalid option";;
  esac
fi

muted=`amixer get Master|tail -n1|sed -E 's/.*\[([a-z]+)\]/\1/'`
volume=`amixer get Master|tail -n1|sed -E 's/.*\[([0-9]+)\%\].*/\1/'`

if [[ $muted == "off" ]]; then
  notify-send "Muted" -t 1000 -i notification-audio-volume-muted -h int:value:$volume
else
  notify-send "Volume" -t 1000 -i notification-audio-volume-medium -h int:value:$volume
fi

