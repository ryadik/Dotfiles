" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'akinsho/bufferline.nvim'
Plug 'Yggdroot/indentLine'
Plug 'nvim-lualine/lualine.nvim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'airblade/vim-gitgutter'

Plug 'christoomey/vim-tmux-navigator'

Plug 'terrortylor/nvim-comment'

Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'morhetz/gruvbox'
Plug 'doums/darcula'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim', { 'as': 'onedark' }

Plug 'preservim/vim-wheel'
Plug 'max397574/better-escape.nvim'

" Initialize plugin system
call plug#end()
