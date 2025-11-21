#!/bin/bash

# Usage: brightness.sh [up|down] [step]
# Example: brightness.sh up 10

STEP=${2:-10}
current=$(ddcutil getvcp 10 | grep -oP 'current value =\s+\K\d+')

if [ "$1" == "up" ]; then
    new=$((current + STEP))
    [ $new -gt 100 ] && new=100
elif [ "$1" == "down" ]; then
    new=$((current - STEP))
    [ $new -lt 0 ] && new=0
else
    echo "Usage: $0 [up|down] [step]"
    exit 1
fi

ddcutil setvcp 10 $new

notify-send -e -h string:x-canonical-private-synchronous:brightness -h \
    "int:value:$new" -t 800 "Brightness: ${new}%"
