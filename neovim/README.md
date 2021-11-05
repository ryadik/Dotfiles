# Neovim configuration

To set up, install [vim-plug][vim-plug] and then install the plugins.

    $ curl -L -o ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    $ nvim +PlugInstall +qa

If the python3 provider is missing:
    $ python3 -m pip install --user --upgrade pynvim/
    $ nvim :UpdateRemotePlugin +qa

Neovim configuate with CoC is on nvim-with-coc branch (is no longer support now)
Latest changes is on master branch

### todo

- [x] check nvim-autopairs and tree-sitter work together
- [x] fix trouble with nvim icons (why is this doesn't work)
- [ ] may be i should rebuild my native lsp config
- [ ] multiple cursor (not exactly)
- [ ] from .vim files to .lua

### useful links

[lsp-config-master]: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

[vim-plug]: https://github.com/junegunn/vim-plug
