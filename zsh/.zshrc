# --- Zsh Plugin Manager: Antigen ---
# Ensure Antigen is sourced early
source /opt/homebrew/share/antigen/antigen.zsh

# --- ASDF Version Manager ---
# Source ASDF for language version management
source /opt/homebrew/opt/asdf/libexec/asdf.sh

# --- SCM Puff ---
# Initialize scmpuff for Git repository management
eval "$(scmpuff init -s)"

# --- Custom PATH Additions ---
# Prepend ~/bin to $PATH if it exists.
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# --- Antigen Plugin Configuration ---
antigen use oh-my-zsh
antigen theme robbyrussell

antigen bundles <<EOBUNDLES
  bundler
  git
  rails
  zsh-completions
  command-not-found
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-autosuggestions
  hlissner/zsh-autopair
EOBUNDLES

antigen apply

# --- Zoxide Smart CD ---
eval "$(zoxide init zsh)"

# --- Editor Configuration ---
# Set preferred editor based on session type (local vs. SSH)
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# --- Neovim Aliases ---
alias vim="nvim"
alias v="nvim"

# --- Tmux Aliases ---
alias tls="tmux ls"
alias tos="tmux attach -t"
alias tws="~/.dotfiles/tmux/tmux_ws.sh"
alias tns="tmux new -s"
alias trs="tmux rename-session -t"
alias tks="tmux kill-session -t"

# --- Git Aliases ---
alias g="git"
alias gst="git status -sb"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gpom="git push origin master"
alias gpo="git push origin"
alias glog='git log --pretty=format:"%C(yellow)%h%C(reset) %C(green)%ar%C(reset) %C(bold blue)%an%C(reset) %C(red)%d%C(reset) %s" --graph --abbrev-commit --decorate'
alias gd="git diff"
alias gap="git add -p"
alias gaa="git add ."
alias gc="git commit"
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -D"
alias gca="git commit --amend"
alias gmc='git ls-files --unmerged | cut -f2 | uniq' # git merge conflicts
alias glh="git lg | head -n 20"
alias grv="git remote -v"
alias gfo="git fetch origin"
alias gclr="git reset HEAD --hard ; git clean -fd"
alias gz="git archive -o snapshot.zip HEAD"
alias gt="git archive -o snapshot.tar.gz HEAD"
alias gpr="git --no-pager lg HEAD --not $1"
alias grp="git remote prune origin"
alias grhh="git reset HEAD --hard"
alias gsh="git stash"
alias gshp="git stash pop"

# --- Node & NPM Aliases ---
alias nrs="npm run start"
alias nrd="npm run dev"
alias nrb="npm run build"
alias nud="npm update"
alias nug="npm upgrade"
alias ni="npm install"
alias ncu="npm-check-updates"
alias ncuu="npm-check-updates -u && npm install"

# --- File System Aliases ---
# alias ll='ls -ahl'
alias ls="eza -a --icons"
alias ll="eza -al --icons --git"
alias tree="eza -T --icons"
alias lt="ll -a --tree --level=2 --git"
alias cat="bat --paging=never"
alias cat_p="bat"

# --- Utility Aliases ---
alias port="lsof -i"
alias kp="npx kill-port"
alias lg="lazygit"
alias clear_modules="rm -rf ./node_modules ; rm ./package-lock.json"
alias code="code ./"
alias ws="webstorm"

# --- Brew Aliases ---
alias hbup="brew update"
alias hbug="brew upgrade"
alias hbs="brew search"
alias hbi="brew install"
alias hbui="brew uninstall"

# --- Bundle Aliases ---
alias dfu="brew bundle dump --force --file=$HOME/.dotfiles/Brewfile && git -C $HOME/.dotfiles/ add . && git -C $HOME/.dotfiles/ commit -m 'feat(bundle): SYSTEM update Brewfile via brew bundle dump'"
alias dfs="stow --restow --target=$HOME git kitty lazygit neovim ruby tmux zsh"

# --- Python Aliases ---
alias python="python3"
alias pip="pip3"

# --- Zsh Vars ---
COMPLETION_WAITING_DOTS="true"
DEFAULT_USER="ryadik"
BAT_THEME="Visual Studio Dark+"

# --- Language Version Managers (Post-Antigen/Core setup) ---
eval "$(pyenv init -)"

