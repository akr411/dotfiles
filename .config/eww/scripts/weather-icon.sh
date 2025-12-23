#!/bin/bash

source "$(dirname "$0")/fetch-weather.sh"

fetch_with_cache "wttr.in/?format=%c" "$HOME/.cache/eww_weather_icon" "..." | head -n1 | xargs
