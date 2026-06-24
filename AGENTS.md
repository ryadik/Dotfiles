# AGENTS.md

This file provides guidance to coding agents working in this repository.

## Repository Purpose

macOS dotfiles managed with **GNU Stow**. Each top-level directory (`zsh/`, `fish/`, `ghostty/`, `kitty/`, etc.) mirrors `$HOME` and gets symlinked there by Stow. The repo targets Apple Silicon Macs (M1+).

## Key Commands

```bash
# Apply all dotfiles (re-create symlinks)
stow --restow --target="$HOME" fish gemini ghostty git glow kitty lazygit neovim opencode ruby tmux vscode yazi zsh

# Aliases/abbreviations:
dfs   # restow dotfiles (same as above)
dfu   # dump installed Homebrew packages to Brewfile_new
dfuc  # dump Brewfile and commit it

# Full installation (new machine)
$HOME/.dotfiles/install.sh

# Update all Homebrew packages
brew update && brew upgrade && brew bundle install --file="$HOME/.dotfiles/Brewfile"

# Add installed packages to Brewfile manually
brew bundle dump --force --file="$HOME/.dotfiles/Brewfile"
```

## Architecture

### Stow Convention
Every config directory uses the GNU Stow pattern: files sit at their target path relative to the package root. `stow --target="$HOME" <pkg>` creates symlinks from `~/<path>` → `~/.dotfiles/<pkg>/<path>`.

Example: `tmux/.tmux.conf` → `~/.tmux.conf`

The `tmux/.stow-local-ignore` file excludes `tmux_ws.sh` (a helper script that stays in the repo but isn't symlinked).

### install.sh Flow
1. Install/update Homebrew → `brew bundle install` from `Brewfile`
2. Set Homebrew Zsh as default shell
3. Clone AstroNvim template into `neovim/.config/nvim/` and remove its `.git` (so it integrates with the dotfiles repo)
4. Make `tmux/tmux_ws.sh` and `zsh/zsh-aliases` executable
5. Stow all packages, including Fish and Ghostty
6. Configure ASDF (Python 3.13.3, Node.js LTS, Go latest)
7. Install global npm package `npm-check-updates` and Python's `pynvim`

### Shells
Zsh is still the default login shell. It is kept light enough for fallback use: no `command-not-found`, no zsh correction, and no startup-time `go env` call. Fish is available as an interactive trial shell with built-in autosuggestions, completions, syntax highlighting, `zoxide`, `starship`, and optional `atuin`.

Run `fish` to try it without changing the login shell.

### Terminals
Kitty remains installed and now uses macOS blur with Tokyo Night. Ghostty is also configured with Tokyo Night colors, JetBrains Mono Nerd Font, macOS glass-style blur, and keybinds close to the Kitty setup.

### Neovim
The `neovim/.config/nvim/` directory is **not committed** — it's populated at install time by cloning the AstroNvim template. If the directory is missing, run step 4 of `install.sh` manually or re-run the full script.

### Language Versions
Managed by ASDF. Global versions are written to `~/.tool-versions`. Use `asdf install <lang> <version>` and `asdf set <lang> <version>` (ASDF 0.18+) to change versions.

### Git Config
`git/.gitconfig` uses `includeIf` to apply `git/.corp.gitconfig` for work repositories (based on directory path). Personal config is in `.gitconfig`, work overrides in `.corp.gitconfig`.

## Tool-Specific Notes

- **Tmux prefix**: remapped to `Ctrl+A`
- **Aliases**: zsh aliases live in `zsh/.zshrc`; fish abbreviations live in `fish/.config/fish/config.fish`
- **Theme**: Tokyo Night across Kitty, Ghostty, VSCode, and Gemini CLI
- **Font**: JetBrains Mono Nerd Font (install manually from `data/fonts/` if icons are missing)
- **Gemini CLI secrets**: stored in `gemini/.gemini/.env` (not committed; see `.env.example`)
