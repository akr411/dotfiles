# zypper
alias zp="zypper"
alias szp="sudo zypper"

# vim -> nvim
alias v="nvim"
alias vim="nvim"

# cat -> bat
alias cat="bat"

# ls -> eza
alias l="eza -a1 --color=always --icons=always --group-directories-first"
alias ls="eza -lah --color=always --icons=always --group-directories-first"
alias lt="eza -aT --color=always --icons=always --group-directories-first"

# git
alias g="git"
alias ga="git add"
alias gap="ga --patch"
alias gb="git branch"
alias gba="gb --all"
alias gc="git commit"
alias gca="gc --amend --no-edit"
alias gce="gc --amend"
alias gco="git checkout"
alias gcl="git clone --recursive"
alias gd="git diff --output-indicator-new=" " --output-indicator-old=" ""
alias gds="gd --staged"
alias gi="git init"
alias gl="git log --graph --all --pretty=format:'%C(magenta)%h %C(white) %an  %ar%C(blue)  %D%n%s%n'"
alias gm="git merge"
alias gn="git checkout -b"  # new branch
alias gp="git push"
alias gr="git reset"
alias gs="git status --short"
alias gu="git pull"

gcm() { git commit --message "$1" }

# colorize help
alias -g -- -h="-h 2>&1 | bat --language=help --style=plain"
alias -g -- --help="--help 2>&1 | bat --language=help --style=plain"
