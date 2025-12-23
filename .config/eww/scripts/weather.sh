#!/bin/bash

source "$(dirname "$0")/fetch-weather.sh"

fetch_with_cache "wttr.in/?format=%t" "$HOME/.cache/eww_weather_temp" "--" | sed 's/[+°C]//g' | xargs
