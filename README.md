#  Dotfiles

A collection of configs and scripts for quickly and automatically setting up my working environment on macOS.

**[Русская версия](README.russian.md)**

## Table of Contents

*   [✨ Features](#-features)
*   [🚀 Installation Requirements](#-requirements)
*   [💻 Installation](#-installation)
    *   [Git-Free Installation](#git-free)
    *   [Manual Installation](#manual)
    *   [After Running `install.sh`](#after-running-installsh)
*   [⚙️ Usage and Management](#-usage-and-management)
*   [⌨️ Hotkeys and Aliases](#-hotkeys-and-aliases)
*   [📂 Dotfiles Structure](#-dotfiles-structure)
*   [⚠️ Troubleshooting](#-troubleshooting)

---

## ✨ Features

These dotfiles configure and manage the following key components:

*   **Zsh**: Main shell with Antigen and Oh-my-zsh.
*   **Tmux**: Terminal window manager.
*   **Neovim**: Uses pre-configured AstroVim (pulled in `install.sh` so it's not stored here and is always up-to-date).
*   **Kitty**: Main terminal.
*   **ASDF**: Used for managing Python and Node.js versions.
*   **Git**: Personal and work rules are configured.
*   **LazyGit**: GUI for Git in the terminal.
*   **VSCode**: All my using VSC Ext, settings and customizations.
*   **Gemini-CLI**: Configs for Gemini-cli.
*   **macOS Defaults**: Automated macOS settings for Finder, Dock. (Experimental)
*   **Stow**: For symlinking all configs from the repository to the correct locations in the home directory.

## 🚀 Requirements

*   **Mac**: All paths are set for Macs with Apple Silicon (M1 and higher).
*   **OS**: Tested only on the latest system.
*   **Utilities**: `curl` and `unzip` (usually pre-installed).

## 💻 Installation

### Git-Free

The installation process is designed for a **new or relatively clean macOS system**. If you already have `brew`, `nvm`, `pyenv`, or other version managers/packages installed, it is recommended to uninstall them first to avoid conflicts.

In the standard macOS terminal (`Terminal.app`), execute the following command.

```bash
curl -L "https://github.com/ryadik/Dotfiles/archive/refs/heads/master.zip" -o "/tmp/dotfiles_temp.zip" && unzip -q "/tmp/dotfiles_temp.zip" -d "/tmp/" && mv "/tmp/Dotfiles-master" "$HOME/.dotfiles" && rm "/tmp/dotfiles_temp.zip" && chmod +x "$HOME/.dotfiles/install.sh" && "$HOME/.dotfiles/install.sh"
```

This command will download the `Dotfiles` repository, extract it to `~/.dotfiles`, and then run the main `install.sh` script.

### Manual

If you already have `Git` installed, or want to download the repository yourself, it is recommended to place the files at `$HOME/.dotfiles/` (usually `$HOME = /Users/user_name = ~/`) to avoid path errors.

After you have downloaded the project, execute this command to make `install.sh` executable:

```bash
chmod +x "$HOME/.dotfiles/install.sh"
```

Then, run the `install.sh` script with the command:

```bash
$HOME/.dotfiles/install.sh
```

### After Running `install.sh`

1.  **Restart your terminal:** Close the current terminal and open a new one. This is necessary for Zsh to fully load all new settings, plugins, and environment variables.
2.  **Install Fonts (optional):** By default, JetBrains Mono Nerd Font will be used. Fonts are located in the `.dotfiles/data/fonts` folder. This will ensure correct display of icons and symbols in the terminal.
3.  **Configure SSH Keys (optional):** Add your SSH keys and configure `ssh-agent` if necessary for working with Git repositories.

## ⚙️ Usage and Management

*   **Updating Homebrew Packages:**
    To update all formulae and applications installed via Homebrew:
    ```bash
    brew update && brew upgrade && brew bundle install --file="$HOME/.dotfiles/Brewfile"
    ```

*   **Dumping Changes to Brewfile:**
    If you have installed new packages manually via `brew install` or `brew cask install` and want to add them to your `Brewfile`:
    ```bash
    dfu
    ```
    This alias will commit changes automatically. **CHECK BEFORE PUSHING!**

*   **Restowing Dotfiles:**
    If you make changes to the source dotfiles and want to recreate the symlinks, use the alias:
    ```bash
    dfs
    ```
*   **Language Version Management (ASDF):**
    *   Install a new Python version:
        ```bash
        asdf install python <version>
        ```
    *   Install a new NodeJS version:
        ```bash
        asdf install nodejs <version>
        ```

## ⌨️ Hotkeys and Aliases

There are many different aliases for various tasks, custom hotkeys, and redefinitions of default ones. For example, for **Tmux**, the **prefix:** is redefined to `Ctrl+a` (instead of `Ctrl+b`); for **Git** there is an abbreviation `g` for `git`.
More details can be found in the configs themselves. Aliases are located in `.dotfiles/zsh/.zshrc`. Hotkeys are individually defined in their respective configs.

## 📂 Dotfiles Structure

```
.
├── data
│   └── fonts                     # Fonts (for manual installation)
│       └── ...
│
├── gemini                        # Gemini-CLI configuration
│   └── .gemini
│       ├── .env.example
│       └── settings.json
│ 
├── git                           # Git configuration
│   ├── .corp.gitconfig
│   ├── .gitconfig
│   └── .gitignore_global
│
├── kitty                         # Kitty configuration
│   └── .config
│       └── kitty
│           ├── kitty.conf
│           └── themes
│               └── dracula.conf
│
├── lazygit                       # Lazygit configuration
│   └── Library
│       └── Application Support
│           └── lazygit
│               └── config.yml
│
├── neovim                        # Neovim configuration
│   ├── .config
│   │   └── nvim
│   └── .vimrc
│
├── ruby                          # Ruby configuration
│   └── .gemrc
│
├── tmux                          # Tmux configuration
│   ├── .stow-local-ignore
│   ├── .tmux.conf
│   └── tmux_ws.sh
│
├── vscode                        # VSCode configuration
│   └── .vscode
│       ├── themes
│       │   ├── rounded
│       │   │   ├── script.js
│       │   │   └── style.css
│       │   └── untitled
│       │       ├── script.js
│       │       └── style.css
│       └── settings.json
│ 
├── zsh                           # Zsh configuration
│   ├── .zshenv
│   └── .zshrc
│
├── Brewfile                      # Defines all Homebrew formulae and casks to install
├── install.sh                    # Main installation script
├── LICENSE                       # License (if applicable)
├── README.md                     # This file
```

## ⚠️ Troubleshooting

*   **"Command not found"**: Ensure your terminal has been restarted after installation. Check your `$PATH` (`echo $PATH`).
*   **Symbol/Icon display issues**: Make sure you have installed Nerd Fonts (e.g., JetBrains Mono Nerd Font) in macOS and selected them in your Kitty settings.

---
