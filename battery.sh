#!/bin/bash

CURRENT="high"
while true
do
  if [[ $CURRENT -eq "high" ]]; then
    battery_level=`acpi -b |head -1| grep -P -o '[0-9]+(?=%)'`
    echo $CURRENT
    if [ $battery_level -le 90 ]; then
      # notify-send -t 0 -u critical "Battery is below 10%!" "Plug me in, asshole!"    
      /usr/bin/espeak "Battery below 10 percent. Plug me in, asshole"
      i3-nagbar -t warning -m "Battery is below 10%!" "Plug me in, asshole!"    
      CURRENT="low"
    fi
  else

    echo $CURRENT
    continue
  fi

  sleep 300 # 300 seconds or 5 minutes
done
