# My Dotfiles

This repository contains my personal dotfiles, managed using GNU Stow. These dotfiles configure my system and applications to my preferred settings. Specifically, this repository manages configurations for `bat`, `mise`, `nvim`, `tmux`, and `zsh`.

## Requirements

Before installing, ensure you have the following packages installed on your system:

### Git

Git is required for cloning the repository.

**openSUSE:**

```bash
sudo zypper install git
```

**Debian/Ubuntu:**

```bash
sudo apt-get update
sudo apt-get install git
```

**Arch Linux:**

```bash
sudo pacman -S git
```

**macOS (using Homebrew):**

```bash
brew install git
```

### GNU Stow

GNU Stow is used to create symbolic links from the dotfiles to your home directory.

**openSUSE:**

```bash
sudo zypper install stow
```

**Debian/Ubuntu:**

```bash
sudo apt-get update
sudo apt-get install stow
```

**Arch Linux:**

```bash
sudo pacman -S stow
```

**macOS (using Homebrew):**

```bash
brew install stow
```

### Optional Dependencies

Depending on the configurations you choose to install, you may need the following:

- **bat:** A `cat` clone with syntax highlighting. Install with your system's package manager (e.g., `sudo apt install bat`, `brew install bat`).
- **mise:** (Previously known as `rtx`) A tool for managing multiple language runtime versions. See [https://mise.jdx.dev/](https://mise.jdx.dev/) for installation instructions.
- **nvim:** Neovim, a modern fork of Vim. Install with your system's package manager (e.g., `sudo apt install neovim`, `brew install neovim`).
- **tmux:** A terminal multiplexer. Install with your system's package manager (e.g., `sudo apt install tmux`, `brew install tmux`).
- **zsh:** Zsh shell. Install with your system's package manager (e.g., `sudo apt install zsh`, `brew install zsh`). You may also need to install a Zsh plugin manager like `zplug` or `oh-my-zsh` separately if your configuration relies on one.

## Installation

Follow these steps to install the dotfiles:

1. **Clone the repository:** Clone this repository into your `$HOME` directory.

    ```bash
    git clone git@github.com/dreamsofautonomy/dotfiles.git
    cd dotfiles
    ```

2. **Use GNU Stow to create symlinks:** Navigate to the dotfiles directory and use `stow` to create symbolic links. Each directory within the dotfiles directory (e.g., `bat`, `mise`, `nvim`, `tmux`, `zsh`) represents a package that `stow` can manage. To stow all packages, you can use the following:

    ```bash
    stow .
    ```

    Alternatively, to stow a specific package (e.g., `bat`), use:

    ```bash
    stow bat
    ```

    You can stow multiple packages at once:

    ```bash
    stow bat nvim zsh
    ```

## Usage

- After installation, you may need to restart your shell or applications for the changes to take effect. For example, you may need to start a new `tmux` session or restart `nvim`.
- To update your dotfiles, simply pull the latest changes from the repository and re-run `stow`.

  ```bash
  git pull
  stow . # or stow <package_name>
  ```

## Organization

The repository is organized into directories, each representing a specific application or configuration area:

- `bat`: Configuration files for `bat`.
- `mise`: Configuration files for `mise`.
- `nvim`: Configuration files for `nvim`.
- `tmux`: Configuration files for `tmux`.
- `zsh`: Configuration files for `zsh`.
