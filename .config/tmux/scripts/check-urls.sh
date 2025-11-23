#!/usr/bin/env bash
tmux capture-pane -J -p -S - | sed 's/\x1b\[[0-9;]*m//g' | \
  grep -qE '(https?|ftp|file)://|www\.|[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}|git@'
