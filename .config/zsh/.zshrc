### Initialize zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

### History
HISTSIZE=10000
HISTFILE="${ZDOTDIR}/.zsh_history"
SAVEHIST=$HISTSIZE
HISTDUP=erase
HIST_IGNORE="(ls|cd|cd ..|pwd|exit)"

### Opts
setopt promptsubst
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt always_to_end          # cursor moved to the end in full completion
setopt hash_list_all          # hash everything before completion
setopt completealiases        # complete aliases
setopt always_to_end          # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word       # allow completion from within a word/phrase
setopt nocorrect              # spelling correction for commands
setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.
setopt nolisttypes
setopt listpacked
setopt automenu

### Sourcings
[[ ! -f "${ZDOTDIR}/.aliases" ]] || source "${ZDOTDIR}/.aliases"
[[ ! -f "${ZDOTDIR}/.utils" ]] || source "${ZDOTDIR}/.utils"

### Bindings
bindkey -v # vi mode
bindkey -M viins 'kj' vi-cmd-mode
bindkey '^j' history-search-forward
bindkey '^k' history-search-backward

### Prompt
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

zi ice atinit"
    ZSH_TMUX_FIXTERM=true
    ZSH_TMUX_AUTOSTART=true
    ZSH_TMUX_AUTOCONNECT=true
"
zi snippet OMZP::tmux

### Snippets
zi wait lucid for \
    OMZL::git.zsh \
    OMZP::git \
    OMZP::fzf \
    hlissner/zsh-autopair

### Plugins
zi wait lucid for \
    light-mode atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
        zdharma-continuum/fast-syntax-highlighting \
    light-mode blockf atpull'zinit creinstall -q .' \
    atinit"
        zstyle ':completion:*' completer _expand _complete _ignored _approximate
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
        zstyle ':completion:*' menu select=2
        zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
        zstyle ':completion:*:descriptions' format '-- %d --'
        zstyle ':completion:*:processes' command 'ps -au$USER'
        zstyle ':completion:complete:*:options' sort false
        zstyle ':fzf-tab:complete:_zlua:*' query-string input
        zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm,cmd -w -w'
        zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
        zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'exa -1 --color=always ${~ctxt[hpre]}$in'
    " \
        zsh-users/zsh-completions \
    light-mode atinit"
        ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
        bindkey '^l' autosuggest-accept
        bindkey '^w' autosuggest-execute
    " \
        atload"!_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    bindmap"^R -> ^H" atinit"
        zstyle :history-search-multi-word page-size 10
        zstyle :history-search-multi-word highlight-color fg=red,bold
        zstyle :plugin:history-search-multi-word reset-prompt-protect 1
    " \
        zdharma-continuum/history-search-multi-word \

### Shell integration
eval "$(zoxide init zsh --cmd cd)"
eval "$(mise activate zsh)"

