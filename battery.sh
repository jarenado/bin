#!/bin/bash
while true
do
    battery_level=`acpi -b |head -1| grep -P -o '[0-9]+(?=%)'`
    if [ $battery_level -le 10 ]; then
       # notify-send -t 0 -u critical "Battery is below 10%!" "Plug me in, asshole!"    
       /usr/bin/espeak "Battery below 10 percent. Plug me in, asshole"
       i3-nagbar -t warning -m "Battery is below 10%!" "Plug me in, asshole!"    
    fi

    sleep 100 # 300 seconds or 5 minutes
done
