#!/bin/bash

if pidof wlsunset >/dev/null; then
    hour=$(date +%H)

    if [ "$hour" -ge 18 ] || [ "$hour" -lt 6 ]; then
        echo '{"text": "󰃜 N", "tooltip": "Night Shift acitve", "class": "active"}'
    else
        echo '{"text": "󰃠 D", "tooltip": "Night Shift inactive", "class": "day"}'
    fi
else
    echo '{"text": "Off", "tooltip", "Night Sift disabled", "class": "disabled"}'
fi
