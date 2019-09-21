#!/bin/sh

#https://gitlab.com/langurmonkey/dotfiles/blob/master/polybar/scripts/memory.sh

case "$1" in
    --popup)
        notify-send "Memory (%)" "$(ps axch -o cmd:10,pmem k -pmem | head | awk '$0=$0"%"' )"
        ;;
    *)
        memory=$(free -h --si | awk '/^Mem:/ {print $3 "/" $2}')
        memory="${memory/,/\.}"
        memory="${memory/,/\.}"
        echo " $memory"
        ;;
esac
