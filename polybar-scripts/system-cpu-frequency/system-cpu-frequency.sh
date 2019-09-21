#!/bin/sh

freq=$(cpupower frequency-info -fm | grep -oP '(?<=frequency: )([^ ]+ [^ ]+)')
#echo " $freq "
filler='________'
padded="$(printf "%s" "$freq${filler:${#freq}}")"
echo " ${padded//'_'/' '}"
