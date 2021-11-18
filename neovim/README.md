# Neovim configuration

### What you should have

- `Neovim =v0.5.1`
- `NodeJS >=v14`
- `Yarn`
- I recomend update `npm` to latest version
- `Python3 & pip3`
- `Ruby & gem` you may get it in my Dotfiles/ruby
- Unix like systems users: `curl or wget, tar (gnu-tar), unzip, gzip` - for install all servers
- Windows system users: `tar, 7zip` - for install all servers

To set up, install [vim-plug][vim-plug] and then install the plugins.

    $ curl -L -o ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    $ nvim +PlugInstall +qa

If the python3 provider is missing:
    $ python3 -m pip install --user --upgrade pynvim/
    $ nvim :UpdateRemotePlugin +qa

If you want to use neovim configuate with CoC checkout to `nvim-with-coc branch` (is no longer support now)

But I recomend you to use neovim configuate with Native LSP coz it really faster and smarter

### posible bugs

#### LSPInstaller doesn't install server automaticly
If `LSPInstaller` doesn't install server automaticly do this command:

    $ [sudo] npm i -g emmet-ls eslint typescript-language-server vls vscode-langservers-extracted 

#### LSP: handle missing client_id in errorm message (like "got bad argument #2 to 'format'")
Go to **Neovim/lsp dir** `/usr/local/share/nvim/runtime/lua/vim/lsp`

And replace your loop to this in line ~450

```lua
for k, fn in pairs(M) do
  M[k] = function(err, method, params, client_id, bufnr, config)
    local _ = log.debug() and log.debug('default_handler', method, {
      params = params, client_id = client_id, err = err, bufnr = bufnr, config = config
    })

    if err then
      -- LSP spec:
      -- interface ResponseError:
      --  code: integer;
      --  message: string;
      --  data?: string | number | boolean | array | object | null;
      if client_id then
        local client = vim.lsp.get_client_by_id(client_id)
        local client_name = client and client.name or string.format("client_id=%d", client_id)
        return err_message(client_name .. ': ' .. tostring(err.code) .. ': ' .. err.message)
      else
        return err_message(tostring(err.code) .. ': ' .. err.message)
      end
    end

    return fn(err, method, params, client_id, bufnr, config)
  end
end
```

### todo

- [x] check nvim-autopairs and tree-sitter work together
- [x] fix trouble with nvim icons (why is this doesn't work)
- [x] may be i should rebuild my native lsp config
- [ ] check about vim folding (usefull feature)
- [ ] setup LSPInstaller
- [ ] translte config (comments) to russian
- [ ] multiple cursor (not exactly)
- [ ] from .vim files to .lua
- [ ] create docs by config (descr of features and mappings)


<!-- ### useful links -->
<!--  -->
<!-- [lsp-config-master]: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md -->
<!--  -->
<!-- [vim-plug]: https://github.com/junegunn/vim-plug -->
