#!/bin/bash

print_bytes() {
    if [ "$1" -eq 0 ] || [ "$1" -lt 1000 ]; then
        bytes="0 kB/s"
    elif [ "$1" -lt 1000000 ]; then
        bytes="$(echo "scale=0;$1/1000" | bc -l ) kB/s"
    else
        bytes="$(echo "scale=1;$1/1000000" | bc -l ) MB/s"
    fi

    echo "$bytes"
}

print_bit() {
    if [ "$1" -eq 0 ] || [ "$1" -lt 10 ]; then
        bit="0 B"
    elif [ "$1" -lt 100 ]; then
        bit="$(echo "scale=0;$1*8" | bc -l ) B"
    elif [ "$1" -lt 100000 ]; then
        bit="$(echo "scale=0;$1*8/1000" | bc -l ) K"
    else
        bit="$(echo "scale=1;$1*8/1000000" | bc -l ) M"
    fi

    echo "$bit"
}

INTERVAL=1

# Considera tutte le interfacce di rete tranne quelle che
# iniziano con br, docker, virbr
# https://stackoverflow.com/a/13175928
# https://unix.stackexchange.com/a/33113

INTERFACES=$(awk 'NR>2{print $1}' /proc/net/dev | sed 's/^br[^ ]*//' | sed 's/^docker[^ ]*//' | sed 's/^virbr[^ ]*//' | tr -d ':')

declare -A bytes

for interface in $INTERFACES; do
    bytes[past_rx_$interface]="$(cat /sys/class/net/"$interface"/statistics/rx_bytes)"
    bytes[past_tx_$interface]="$(cat /sys/class/net/"$interface"/statistics/tx_bytes)"
done

while true; do
    INTERFACES=$(awk 'NR>2{print $1}' /proc/net/dev | sed 's/^br[^ ]*//' | sed 's/^docker[^ ]*//' | sed 's/^virbr[^ ]*//' | tr -d ':')    #In case of connection drop/change
    down=0
    up=0

    for interface in $INTERFACES; do
        bytes[now_rx_$interface]="$(cat /sys/class/net/"$interface"/statistics/rx_bytes)"
        bytes[now_tx_$interface]="$(cat /sys/class/net/"$interface"/statistics/tx_bytes)"

        #if variable is unset or set to the empty string
        #should happen when connection changes
        if [ -z "${bytes[past_rx_$interface]}" ]; then
            bytes[now_rx_$interface]=0
            bytes[now_tx_$interface]=0
            bytes_down=0
            bytes_up=0
            bytes[past_rx_$interface]=0
            bytes[past_tx_$interface]=0
            down=0
            up=0
        else
            bytes_down=$((((${bytes[now_rx_$interface]} - ${bytes[past_rx_$interface]})) / INTERVAL))
            bytes_up=$((((${bytes[now_tx_$interface]} - ${bytes[past_tx_$interface]})) / INTERVAL))
            bytes[past_rx_$interface]=${bytes[now_rx_$interface]}
            bytes[past_tx_$interface]=${bytes[now_tx_$interface]}
            down=$(((( "$down" + "$bytes_down" ))))
            up=$(((( "$up" + "$bytes_up" ))))
        fi
    done

    filler='____________________________'
    before_padding="ﰬ $(print_bytes $down) / ﰵ $(print_bytes $up)"
    padded="$(printf "%s" "$before_padding${filler:${#before_padding}}")"
    echo "${padded//'_'/' '}"
    
    sleep $INTERVAL
done
