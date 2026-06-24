# Paths
function __prepend_path --argument-names dir
    test -d "$dir"; and not contains -- "$dir" $PATH; and set -gx PATH "$dir" $PATH
end

function __append_path --argument-names dir
    test -d "$dir"; and not contains -- "$dir" $PATH; and set -gx PATH $PATH "$dir"
end

__prepend_path /opt/homebrew/sbin
__prepend_path /opt/homebrew/bin
__prepend_path "$HOME/bin"
__append_path "$HOME/go/bin"
__append_path "$HOME/.bun/bin"
__prepend_path "$HOME/.antigravity/antigravity/bin"
__prepend_path "$HOME/.local/bin"

# Environment
set -gx EDITOR nvim
set -gx LANG en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx ENABLE_LSP_TOOL 1
set -gx BAT_THEME "Visual Studio Dark+"
set -gx BUN_INSTALL "$HOME/.bun"

# Integrations
if command -q zoxide
    zoxide init fish | source
end

if command -q starship
    starship init fish | source
end

if command -q atuin
    atuin init fish | source
end

# Editor
abbr --add vim nvim
abbr --add v nvim

# Tmux
abbr --add tls "tmux ls"
abbr --add tos "tmux attach -t"
abbr --add tws "~/.dotfiles/tmux/tmux_ws.sh"
abbr --add tns "tmux new -s"
abbr --add trs "tmux rename-session -t"
abbr --add tks "tmux kill-session -t"

# Git
abbr --add g git
abbr --add gst "git status -sb"
abbr --add gco "git checkout"
abbr --add gcob "git checkout -b"
abbr --add gpom "git push origin master"
abbr --add gpo "git push origin"
abbr --add glog serie
abbr --add gd "git diff"
abbr --add gap "git add -p"
abbr --add gaa "git add ."
abbr --add gc "git commit"
abbr --add gb "git branch"
abbr --add gba "git branch -a"
abbr --add gbd "git branch -D"
abbr --add gca "git commit --amend"
abbr --add glh "git lg | head -n 20"
abbr --add grv "git remote -v"
abbr --add gfo "git fetch origin"
abbr --add grp "git remote prune origin"
abbr --add grhh "git reset HEAD --hard"
abbr --add gsh "git stash"
abbr --add gshp "git stash pop"
abbr --add gconf "git config"
abbr --add gconfL "git config --local"
abbr --add g-set-local-corp-cred "git config --local user.name i.ryadinsky; and git config --local user.email i.ryadinsky@irkpk.ru"
abbr --add g-set-local-pers-cred "git config --local user.name ryadik; and git config --local user.email 15162342h@gmail.com"

# Node and npm
abbr --add nrs "npm run start"
abbr --add nrd "npm run dev"
abbr --add nrb "npm run build"
abbr --add nud "npm update"
abbr --add nug "npm upgrade"
abbr --add ni "npm install"
abbr --add ncu npm-check-updates
abbr --add ncuu "npm-check-updates -u; and npm install"

# Filesystem and utilities
abbr --add ls "eza -a --icons"
abbr --add ll "eza -al --icons --git"
abbr --add tree "eza -T --icons"
abbr --add lt "eza -al --icons --git -a --tree --level=2 --git"
abbr --add cat "bat --paging=never"
abbr --add cat_p bat
abbr --add port "lsof -i"
abbr --add kp "npx kill-port"
abbr --add lg lazygit
abbr --add code "code ./"
abbr --add ws webstorm
abbr --add gmn "gemini --model gemini-3.1-pro-preview"
abbr --add gmnf "gemini --model gemini-3-flash-preview"
abbr --add ask "gemini --model gemini-3-flash-preview -p"
abbr --add regex regex-tui
abbr --add finder yazi
abbr --add bktr book-translator
abbr --add mntr btm

# Brew
abbr --add hbup "brew update"
abbr --add hbug "brew upgrade"
abbr --add hbs "brew search"
abbr --add hbi "brew install"
abbr --add hbui "brew uninstall"
abbr --add nginx_start "brew services start nginx"
abbr --add nginx_stop "brew services stop nginx"
abbr --add dfu "brew bundle dump --force --file=$HOME/.dotfiles/Brewfile_new"
abbr --add dfs "stow --restow --target=$HOME git kitty lazygit neovim ruby tmux zsh fish ghostty"

# Python
abbr --add python python3
abbr --add pip pip3

function gmc --description "List files with git merge conflicts"
    git ls-files --unmerged | cut -f2 | uniq
end

function gclr --description "Hard-reset and clean the current git worktree"
    git reset HEAD --hard
    and git clean -fd
end

function clear-dns-cache --description "Flush macOS DNS cache"
    sudo dscacheutil -flushcache
    and sudo killall -HUP mDNSResponder
end

function clear_modules --description "Remove local Node dependencies and lockfile"
    rm -rf ./node_modules
    rm ./package-lock.json
end

function reload --description "Reload fish"
    echo "fish reloading..."
    exec fish
end

function f --description "Pick a file or directory with fzf and open it in nvim"
    set -l selected (fd --type f --type d --hidden --follow --exclude ".git" . | fzf --height 100% --layout=default --border=rounded --marker='✓' --pointer='►' \
        --color='fg:#c0caf5,bg:#1a1b26,hl:#bb9af7,fg+:#c0caf5,bg+:#292e42,hl+:#bb9af7,info:#7dcfff,prompt:#7dcfff,pointer:#7dcfff,marker:#bb9af7,preview-bg:#1f2335,border:#7dcfff' \
        --preview-window='right,55%,border-rounded' \
        --preview 'if [ -d {} ]; then eza -l --tree --git --git-ignore --color=always --icons=always --level=3 {}; else bat --style=numbers,changes --color=always --line-range :500 {}; fi' \
        --bind "ctrl-c:execute(echo {} | pbcopy)+abort" \
        --header "ENTER: Open | CTRL-C: Copy Path | Scroll Preview: Shift+Up/Down")

    test -n "$selected"; and nvim $selected
end

function fr --description "Live ripgrep search with fzf preview"
    set -l selected (fzf --height 100% --layout=default --border=rounded --marker='✓' --pointer='►' --ansi \
        --color='fg:#c0caf5,bg:#1a1b26,hl:#bb9af7,fg+:#c0caf5,bg+:#292e42,hl+:#bb9af7,info:#7dcfff,prompt:#7dcfff,pointer:#7dcfff,marker:#bb9af7,preview-bg:#1f2335,border:#7dcfff' \
        --preview-window='right,55%,border-rounded,+{2}-10' \
        --header "Live content search. Start typing..." \
        --prompt '> ' \
        --delimiter ':' \
        --preview 'bat --style=numbers,changes --color=always --highlight-line {2} {1}' \
        --bind "change:reload:rg --hidden --column --line-number --no-heading --color=always --smart-case {q} . || true")

    if test -n "$selected"
        set -l file (string split -m1 ':' "$selected")[1]
        set -l line (string split -m2 ':' "$selected")[2]
        nvim "+$line" "$file"
    end
end
