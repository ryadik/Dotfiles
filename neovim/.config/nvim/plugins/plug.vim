" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

Plug 'folke/trouble.nvim'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'onsails/lspkind-nvim'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'

Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'akinsho/bufferline.nvim'
Plug 'Yggdroot/indentLine'
Plug 'nvim-lualine/lualine.nvim'
Plug 'christoomey/vim-tmux-navigator'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'max397574/better-escape.nvim'
Plug 'terrortylor/nvim-comment'
Plug 'folke/todo-comments.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'lewis6991/gitsigns.nvim'

Plug 'morhetz/gruvbox'
Plug 'doums/darcula'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim', { 'as': 'onedark' }
Plug 'VDuchauffour/neodark.nvim', { 'as': 'neodark' }
Plug 'briones-gabriel/darcula-solid.nvim'
Plug 'rktjmp/lush.nvim'

call plug#end()
