#!/usr/bin/env bash

content=$(tmux capture-pane -J -p -S - | sed 's/\x1b\[[0-9;]*m//g')

urls=$(echo "$content" | grep -oE \
    -e '(https?|ftp|file):/?//[-A-Za-z0-9+&@#/%?=~_|!:,.;]*[-A-Za-z0-9+&@#/%=~_|]' \
    -e '(https?://)?www\.[a-zA-Z](-?[a-zA-Z0-9])+\.[a-zA-Z]{2,}(/[^\s]*)?' \
    -e '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}(:[0-9]{1,5})?(/[^\s]*)?' \
    -e '(ssh://)?git@[^\s]*' \
    | sort -u)

selected_urls=$(echo "$urls" | fzf --multi \
    --prompt="URL: " \
    --bind "ctrl-y:execute-silent(echo {} | wl-copy)+abort")

if [ -n "$selected_urls" ]; then
    while IFS= read -r url; do
        if command -v xdg-open &> /dev/null; then
            nohup xdg-open "$url" &> "/tmp/tmux-$(id -u)-url-picker.log"
        elif command -v open &> /dev/null; then
            nohup open "$url" &> "/tmp/tmux-$(id -u)-url-picker.log"
        elif [ -n "$BROWSER" ]; then
            nohup "$BROWSER" "$url" &> "/tmp/tmux-$(id -u)-url-picker.log"
        else
            tmux display-message "No browser command found"
            break
        fi
    done <<< "$selected_urls"
fi
