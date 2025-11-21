#!/bin/bash
# Display cached brightness for Waybar

CACHE_FILE="$HOME/.cache/monitor-brightness"

if [[ -f "$CACHE_FILE" ]]; then
    brightness=$(<"$CACHE_FILE")
else
    brightness="--"
fi

if [[ "$brightness" == "--" ]]; then
    icon=""
elif [[ "$brightness" -lt 10 ]]; then
    icon="󰃜"
elif [[ "$brightness" -lt 25 ]]; then
    icon="󰃝"
elif [[ "$brightness" -lt 50 ]]; then
    icon="󰃞"
elif [[ "$brightness" -lt 75 ]]; then
    icon="󰃟"
else
    icon="󰃠"
fi

echo "{\"text\": \"$icon $brightness%\", \"percentage\": $brightness}"
