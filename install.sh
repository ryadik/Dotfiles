#!/bin/bash

# --------------------------- Configuration Variables ----------------------------
DOTFILES_DIR="$HOME/.dotfiles"
ASTRO_NVIM_CONFIG_DIR="$DOTFILES_DIR/neovim/.config/nvim"
TMUX_SCRIPT="$DOTFILES_DIR/tmux/tmux_ws.sh"
HOMEBREW_PATH="/opt/homebrew/bin"
# --------------------------------------------------------------------------------

# ------------------------------- Helper Functions -------------------------------
# Function to check if a command exists
command_exists () {
  command -v "$1" >/dev/null 2>&1
}

# Function to print messages
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
# --------------------------------------------------------------------------------

# --------------------------- Main Installation Script ---------------------------
log_info "Starting dotfiles installation..."

# --- 1. Install Homebrew ---
if ! command_exists brew; then
  log_info "Homebrew not found. Installing Homebrew..."

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH for current shell session after installation
  if [ -d "/opt/homebrew/bin" ]; then
    # For Apple Silicon
    export PATH="/opt/homebrew/bin:$PATH"
  elif [ -d "/usr/local/bin" ]; then
    # For Intel
    export PATH="/usr/local/bin:$PATH"
  fi

  log_success "Homebrew installed."
else
  log_info "Homebrew is already installed. Updating..."

  brew update

  log_success "Homebrew updated."
fi

# --- 2. Install/Update Brewfile dependencies ---
log_info "Installing/updating Homebrew dependencies from Brewfile..."

if command_exists brew; then
  # Ensure Homebrew Bundle is installed
  if ! brew tap | grep -q "homebrew/bundle"; then
    log_info "Tapping homebrew/bundle..."

    brew tap homebrew/bundle || log_error "Failed to tap homebrew/bundle."
  fi
  brew bundle install --file="$DOTFILES_DIR/Brewfile" || log_error "Failed to install Homebrew dependencies."

  log_success "Homebrew dependencies installed/updated."
else
  log_error "Homebrew is not installed. Cannot run brew bundle install."
fi

# --- 3. Configure Zsh as default shell (if not already) ---
if ! command_exists zsh; then
  log_error "Zsh not found. Ensure it's installed via Homebrew."
fi

CURRENT_SHELL=$(basename "$SHELL")
# Use brew --prefix for correct path
ZSH_PATH=$(command_exists zsh && brew --prefix zsh)/bin/zsh

if [ "$CURRENT_SHELL" != "zsh" ] || [ "$SHELL" != "$ZSH_PATH" ]; then
  log_info "Setting Zsh as default shell..."

  # Add Zsh to /etc/shells if not already present
  if ! grep -q "$ZSH_PATH" /etc/shells; then
    log_info "Adding $ZSH_PATH to /etc/shells (requires sudo password)."

    echo "$ZSH_PATH" | sudo tee -a /etc/shells >/dev/null
  fi
  chsh -s "$ZSH_PATH" || log_error "Failed to set Zsh as default shell. Please try manually: chsh -s $(which zsh)"

  log_success "Zsh set as default shell. Please restart your terminal or log out/in for changes to take full effect."
else
  log_info "Zsh is already the default shell."
fi

# --- 4. Clone and prepare AstroNvim configuration ---
log_info "Cloning and preparing AstroNvim configuration..."

if [ -d "$ASTRO_NVIM_CONFIG_DIR" ]; then
  log_warn "AstroNvim config directory already exists: $ASTRO_NVIM_CONFIG_DIR. Skipping clone."
else
  git clone --depth 1 https://github.com/AstroNvim/template "$ASTRO_NVIM_CONFIG_DIR" || log_error "Failed to clone AstroNvim template."

  log_info "Removing AstroNvim's .git directory to integrate with dotfiles."

  rm -rf "$ASTRO_NVIM_CONFIG_DIR/.git"

  log_success "AstroNvim cloned and .git removed."
fi

# --- 5. Make tmux script executable ---
log_info "Making tmux_ws.sh executable..."

if [ -f "$TMUX_SCRIPT" ]; then
  chmod +x "$TMUX_SCRIPT" || log_error "Failed to make $TMUX_SCRIPT executable."

  log_success "$TMUX_SCRIPT is now executable."
else
  log_warn "$TMUX_SCRIPT not found. Skipping chmod."
fi

# --- 6. Stow dotfiles ---
log_info "Stowing dotfiles..."

stow --restow --target="$HOME" git kitty lazygit neovim ruby tmux zsh || log_error "Failed to stow dotfiles."

log_success "Dotfiles stowed successfully."

# --- 7. Post-Stow / Language Manager Setup ---
log_info "Running post-stow configurations (asdf, pyenv, language runtimes)..."

# Source ASDF for the current script session
if command_exists asdf && [ -f "$(brew --prefix asdf)/libexec/asdf.sh" ]; then
  source "$(brew --prefix asdf)/libexec/asdf.sh"

  log_info "ASDF initialized for this script session."
  log_info "Adding ASDF plugins (python, nodejs)..."

  asdf plugin add python || log_warn "Python plugin for asdf might already be added or failed. Skipping."
  asdf plugin add nodejs || log_warn "Node.js plugin for asdf might already be added or failed. Skipping."

  log_success "ASDF plugins added."
  log_info "Installing and setting global Python and Node.js versions via ASDF..."

  PYTHON_VERSION="latest:3.11"
  NODEJS_VERSION="lts"

  asdf install python "$PYTHON_VERSION" || log_warn "Failed to install Python $PYTHON_VERSION via asdf. Please install manually if needed."
  asdf global python "$PYTHON_VERSION" || log_warn "Failed to set global Python to $PYTHON_VERSION. Please set manually if needed."

  asdf install nodejs "$NODEJS_VERSION" || log_warn "Failed to install Node.js $NODEJS_VERSION via asdf. Please install manually if needed."
  asdf global nodejs "$NODEJS_VERSION" || log_warn "Failed to set global Node.js to $NODEJS_VERSION. Please set manually if needed."

  log_success "Python and Node.js versions set via ASDF."

  # --- NPM Global Packages ---
  if command_exists npm; then
    log_info "Installing global NPM packages..."

    npm install -g npm-check-updates || log_warn "Failed to install npm-check-updates globally."

    log_success "Global NPM packages installed."
  else
    log_warn "NPM not found. Skipping global NPM packages installation."
  fi

else
  log_warn "ASDF not found or not initialized for this script. Skipping ASDF language installations."
fi

if command_exists python && command_exists pip; then
  log_info "Installing pynvim for Neovim..."
  # Use python -m pip for clarity and to ensure the correct pip is used
  python -m pip install --user --upgrade pynvim || log_warn "Failed to install pynvim. Please check Python/pip setup."
  log_success "pynvim installed."
else
  log_warn "Python or pip not found. Skipping pynvim installation. Ensure an ASDF Python version is globally set or system Python is available."
fi

# ------------------------------------ Final -------------------------------------
log_success "Dotfiles installation complete! Please restart your terminal or log out/in to fully apply Zsh changes and ASDF shims."