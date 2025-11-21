#! /usr/bin/bash
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
# XDG base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# User specific environment and startup programs
export TERM="xterm-256color"
export EDITOR="nvim"
export PAGER="bat"
export HISTCONTROL="ignoredups:erasedups"
export HISTIGNORE='exit:cd:ls:history'
# Bat as manpager
export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"

# Clean home
export HISTFILE="${XDG_STATE_HOME}/bash/history"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export GOPATH="${XDG_DATA_HOME}/go"
export GOBIN="${GOPATH}/bin"
export PYTHONUSERBASE="${XDG_DATA_HOME}/python"
export PYTHON_HISTORY="${XDG_STATE_HOME}/python/python_history"
export PYTHONPYCACHEPREFIX="${XDG_CACHE_HOME}/python"
export CLAUDE_CONFIG_DIR="${XDG_CONFIG_HOME}/claude"
export XCURSOR_PATH="${XDG_DATA_HOME}/icons:/usr/share/icons"
export XCURSOR_THEME=BreezeX-RoséPine
export XCURSOR_SIZE=24

# Path
. "$CARGO_HOME/env" # source all cargo paths
export PATH="$GOBIN:$PATH"
export PATH="${XDG_DATA_HOME}/npm/bin:$PATH"

# User specific environment
if ! [[ "$PATH" =~ $HOME/.local/bin:$HOME/bin: ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# FZF customization
export FZF_DEFAULT_OPTS='
  --color=fg:#908caa,fg+:#d0d0d0,bg:#191724,bg+:#262626
  --color=hl:#ebbcba,hl+:#5fd7ff,info:#9ccfd8,marker:#eb6f92
  --color=prompt:#908caa,spinner:#f6c177,pointer:#c4a7e7,header:#31748f
  --color=gutter:#191724,border:#403d52,label:#aeaeae,query:#d9d9d9
  --border="sharp" --border-label="" --preview-window="border-sharp" --prompt="> "
  --marker=">" --pointer="◆" --separator="─" --scrollbar="│"
  --layout="reverse"'

# Tools
eval "$(keychain --absolute --dir "$XDG_RUNTIME_DIR"/keychain --eval --quiet id_ed25519)"
eval "$(fzf --bash)"
