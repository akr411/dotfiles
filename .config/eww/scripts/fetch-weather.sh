#!/bin/bash

fetch_with_cache() {
  local url=$1
  local cache_file=$2
  local fallback=$3

  mkdir -p "$(dirname "$cache_file")"

  if ping -c 1 -W 2 8.8.8.8 &>/dev/null; then
    result=$(curl -s --max-time 5 "$url")

    if [ -n "$result" ]; then
      echo "$result" > "$cache_file"
      echo "$result"
    elif [ -f "$cache_file" ]; then
      cat "$cache_file"
    else
      echo "$fallback"
    fi
  else
    [ -f "$cache_file" ] && cat "$cache_file" || echo "$fallback"
  fi
}
