" Plugins -------------------------------------------------------------------
runtime ./plugins/plug.vim


" Settings ------------------------------------------------------------------
set mouse=a
set number
set hidden
set cursorline
set scrolloff=10
set expandtab
set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
set encoding=utf8
set history=5000
set clipboard=unnamedplus
set cindent
set noswapfile
set splitbelow
set splitright
set termguicolors
set cc=80
set cmdheight=2 
set updatetime=100
set shortmess+=c
set signcolumn=yes
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set laststatus=2
set nosc noru nosm
set lazyredraw
set ignorecase


" colorscheme darcula
colorscheme dracula 
" colorscheme onedark
" colorscheme gruvbox


" Mappings ------------------------------------------------------------------
runtime ./map.vim

" Plugins configs -----------------------------------------------------------

" nvim-web-devicons
runtime ./plugins/configs/nvim-web-devicons.vim

" telescope
runtime ./plugins/configs/telescope.vim

" nvim-tree
runtime ./plugins/configs/nvim-tree.vim

" better-escape
runtime ./plugins/configs/better-escape.vim

" nvim-comment
runtime ./plugins/configs/nvim-comment.vim

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" lualine
runtime ./plugins/configs/lualine.vim

" bufferline
runtime ./plugins/configs/bufferline.vim

" Coc -----------------------------------------------------------------------
runtime ./plugins/configs/coc.vim
