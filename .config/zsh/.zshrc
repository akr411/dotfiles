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

### Sourcings
[[ ! -f "${ZDOTDIR}/aliases.zsh" ]] || source "${ZDOTDIR}/aliases.zsh"
[[ ! -f "${ZDOTDIR}/options.zsh" ]] || source "${ZDOTDIR}/options.zsh"
[[ ! -f "${ZDOTDIR}/functions.zsh" ]] || source "${ZDOTDIR}/functions.zsh"

### Bindings
bindkey -v # vi mode
bindkey -M viins 'kj' vi-cmd-mode
bindkey '^j' history-search-forward
bindkey '^k' history-search-backward

if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    exec tmux new-session -A -s ${USER} >/dev/null 2>&1
fi

### Prompt
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

### Plugins
zinit for \
    light-mode \
  zsh-users/zsh-autosuggestions \
    light-mode \
  zdharma-continuum/fast-syntax-highlighting \
  zdharma-continuum/history-search-multi-word
# mise
zinit as="command" lucid from="gh-r" for \
    id-as="usage" \
    atpull="%atclone" \
    jdx/usage
zinit as="command" lucid from="gh-r" for \
    id-as="mise" mv="mise* -> mise" \
    atclone="./mise* completion zsh > _mise" \
    atpull="%atclone" \
    atload='eval "$(mise activate zsh)"' \
    jdx/mise

### Shell integration
eval "$(zoxide init zsh --cmd cd)"

