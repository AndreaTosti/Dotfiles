#!/bin/sh

speed=$(sensors | grep  'fan1' | grep -o '[[:space:]][[:digit:]]*' | grep -o '[[:digit:]]*')

if [ "$speed" != "" ]; then
    speed_round=$(echo "scale=1;$speed" | bc -l )
    speed_round=$(echo $speed_round "RPM")
    filler='         '
    padded="$(printf "%s" "$speed_round${filler:${#speed_round}}")"
#    if [ $speed -gt 0 ]; then
        echo " ${padded//'_'/' '}"
#    else
#        echo "ﴛ ${padded//'_'/' '}"
#    fi
else
   echo "???"
fi
