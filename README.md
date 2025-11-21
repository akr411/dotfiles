# Dotfiles

Personal configuration files for my Fedora + Sway environment.

## Setup

Clone and setup on a new system:

```bash
git clone --bare <repo-url> ~/.local/share/dotfiles
alias bare='/usr/bin/git --git-dir=$HOME/.local/share/dotfiles --work-tree=$HOME'
bare checkout
bare config --local status.showUntrackedFiles no
```

Add the alias to your .bashrc:
```bash
echo "alias bare='/usr/bin/git --git-dir=$HOME/.local/share/dotfiles --work-tree=$HOME'" >> ~/.bashrc
```
## What's Included

  - Shell: Modular bash configuration (.bashrc.d/)
  - Wayland/Sway: Window manager, waybar, swaylock, rofi
  - Terminal: foot, tmux with custom scripts
  - Apps: bat, git, dunst, zathura
  - Theming: GTK 2/3/4, wallpapers
  - Scripts: Brightness control, nightshift, tmux-zen

## Usage
```bash
bare status
bare add .config/app/config
bare commit -m "Update config"
bare push
```
