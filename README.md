# dotfiles

> These are my dotfiles. There are many like them, but these ones are mine.

# Install Brew

    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Clone repository to your $HOME

    $ git clone git@github.com:k1ngsman-hub/Dotfiles.git ~/.dotfiles
    $ cd ~/.dotfiles

# Install All the software packages

    $ brew bundle
    $ curl -L -o ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    $ nvim +PlugInstall +qa

#### If the python3 provider is missing:

    $ python3 -m pip install --user --upgrade pynvim/
    $ nvim :UpdateRemotePlugin +qa

# Add path for antigen and asdf into your .zshrc file
    check path in brew logs or choose in .zshrc

# Symlink dotfiles

    $ stow git alacritty neovim tmux personal-git ruby ssh zsh

If you got this error:
    
    WARNING! unstowing bash would cause conflicts:
    * existing target is neither a link nor a directory: [some dir]

Delete your current config files and try again
