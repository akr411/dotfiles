#!/bin/bash

source "$(dirname "$0")/fetch-weather.sh"

fetch_with_cache "wttr.in/?format=%C" "$HOME/.cache/eww_weather_condition" "No connection"
