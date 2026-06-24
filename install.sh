#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
ASTRO_NVIM_CONFIG_DIR="$DOTFILES_DIR/neovim/.config/nvim"
TMUX_SCRIPT="$DOTFILES_DIR/tmux/tmux_ws.sh"
ZSH_ALIASES_SCRIPT="$DOTFILES_DIR/zsh/zsh-aliases"
STOW_PACKAGES=(
  fish
  ghostty
  git
  glow
  kitty
  lazygit
  neovim
  opencode
  ruby
  tmux
  vscode
  yazi
  zsh
)

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

log_info() {
  echo -e "\033[0;34m[INFO]\033[0m $1"
}

log_success() {
  echo -e "\033[0;32m[SUCCESS]\033[0m $1"
}

log_warn() {
  echo -e "\033[0;33m[WARN]\033[0m $1"
}

log_error() {
  echo -e "\033[0;31m[ERROR]\033[0m $1"
  exit 1
}

install_or_update_homebrew() {
  if ! command_exists brew; then
    log_info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if [ -d "/opt/homebrew/bin" ]; then
      export PATH="/opt/homebrew/bin:$PATH"
    elif [ -d "/usr/local/bin" ]; then
      export PATH="/usr/local/bin:$PATH"
    fi

    log_success "Homebrew installed."
    return
  fi

  log_info "Updating Homebrew..."
  brew update
  log_success "Homebrew updated."
}

install_brewfile_dependencies() {
  command_exists brew || log_error "Homebrew is not installed."

  log_info "Installing Homebrew dependencies from Brewfile..."
  brew bundle install --file="$DOTFILES_DIR/Brewfile" || log_error "Failed to install Homebrew dependencies."
  log_success "Homebrew dependencies installed."
}

set_zsh_as_default_shell() {
  command_exists zsh || log_error "Zsh not found. Ensure it is installed via Homebrew."

  local zsh_path
  zsh_path="$(brew --prefix zsh)/bin/zsh"

  if [ "$SHELL" = "$zsh_path" ]; then
    log_info "Zsh is already the default shell."
    return
  fi

  log_info "Setting Zsh as default shell..."

  if ! grep -q "$zsh_path" /etc/shells; then
    log_info "Adding $zsh_path to /etc/shells."
    echo "$zsh_path" | sudo tee -a /etc/shells >/dev/null
  fi

  chsh -s "$zsh_path" || log_error "Failed to set Zsh as default shell. Try manually: chsh -s $zsh_path"
  log_success "Zsh set as default shell. Restart your terminal or log out/in to apply it."
}

prepare_neovim() {
  log_info "Preparing AstroNvim configuration..."

  if [ -d "$ASTRO_NVIM_CONFIG_DIR" ]; then
    log_warn "AstroNvim config already exists: $ASTRO_NVIM_CONFIG_DIR. Skipping clone."
    return
  fi

  git clone --depth 1 https://github.com/AstroNvim/template "$ASTRO_NVIM_CONFIG_DIR" || log_error "Failed to clone AstroNvim template."
  rm -rf "$ASTRO_NVIM_CONFIG_DIR/.git"
  log_success "AstroNvim template installed."
}

make_scripts_executable() {
  log_info "Making helper scripts executable..."

  if [ -f "$TMUX_SCRIPT" ]; then
    chmod +x "$TMUX_SCRIPT" || log_error "Failed to make $TMUX_SCRIPT executable."
  else
    log_warn "$TMUX_SCRIPT not found."
  fi

  if [ -f "$ZSH_ALIASES_SCRIPT" ]; then
    chmod +x "$ZSH_ALIASES_SCRIPT" || log_error "Failed to make $ZSH_ALIASES_SCRIPT executable."
  else
    log_warn "$ZSH_ALIASES_SCRIPT not found."
  fi

  log_success "Executable permissions updated."
}

stow_dotfiles() {
  log_info "Stowing dotfiles..."
  stow --restow --target="$HOME" "${STOW_PACKAGES[@]}" || log_error "Failed to stow dotfiles."
  log_success "Dotfiles stowed."
}

configure_asdf() {
  local asdf_script
  asdf_script="$(brew --prefix asdf)/libexec/asdf.sh"

  if ! command_exists asdf || [ ! -f "$asdf_script" ]; then
    log_warn "ASDF not found. Skipping language runtime setup."
    return
  fi

  source "$asdf_script"

  local python_version="latest:3.13.3"
  local nodejs_version="lts"
  local golang_version="latest"

  log_info "Adding ASDF plugins..."
  asdf plugin add python || log_warn "ASDF python plugin already exists or failed."
  asdf plugin add nodejs || log_warn "ASDF nodejs plugin already exists or failed."
  asdf plugin add golang || log_warn "ASDF golang plugin already exists or failed."

  log_info "Installing ASDF runtimes..."
  asdf install python "$python_version" || log_error "Failed to install Python $python_version."
  asdf install nodejs "$nodejs_version" || log_error "Failed to install Node.js $nodejs_version."
  asdf install golang "$golang_version" || log_error "Failed to install Go $golang_version."

  log_info "Setting global ASDF runtimes..."
  (cd "$HOME" && asdf set python "$python_version") || log_error "Failed to set global Python."
  (cd "$HOME" && asdf set nodejs "$nodejs_version") || log_error "Failed to set global Node.js."
  (cd "$HOME" && asdf set golang "$golang_version") || log_error "Failed to set global Go."

  asdf reshim || log_warn "ASDF reshim failed."
  log_success "ASDF runtimes configured."
}

install_language_tools() {
  if ! command_exists asdf; then
    log_warn "ASDF not found. Skipping npm and Python helper packages."
    return
  fi

  if command_exists npm; then
    log_info "Installing global npm packages..."
    asdf exec npm install -g npm-check-updates || log_warn "Failed to install npm-check-updates."
  else
    log_warn "npm not found. Skipping global npm packages."
  fi

  if command_exists python && command_exists pip; then
    log_info "Installing pynvim..."
    asdf exec python -m pip install --user --upgrade pynvim || log_warn "Failed to install pynvim."
  else
    log_warn "python or pip not found. Skipping pynvim."
  fi
}

main() {
  log_info "Starting dotfiles installation..."

  install_or_update_homebrew
  install_brewfile_dependencies
  set_zsh_as_default_shell
  prepare_neovim
  make_scripts_executable
  stow_dotfiles
  configure_asdf
  install_language_tools

  log_success "Dotfiles installation complete. Restart your terminal or log out/in to fully apply shell changes."
}

main "$@"
