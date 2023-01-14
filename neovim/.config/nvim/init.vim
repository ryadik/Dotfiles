" Plugins -------------------------------------------------------------------
runtime ./plugins/plug.vim


" Settings ------------------------------------------------------------------
set mouse=a " enable mouse working
set number " enable row numeric
set hidden " enable hide buffer
set cursorline " glow cursor line
set scrolloff=10 " offset for scroll
set nospell " disable orphografic checker
set nowrap " disable row wrap

" tab settings
set tabstop=2
set shiftwidth=2
set smartindent
set expandtab
set cindent " auto indent

set encoding=utf8
set history=5000 " history of : commands
set clipboard=unnamedplus " shared clipboard
set noswapfile

" split settings
set splitbelow
set splitright

set termguicolors " for colorschemas
set cc=80 " colorcolumn
set cmdheight=2
set updatetime=100
set shortmess+=c " buffer changing
set signcolumn=yes " display column signs
set laststatus=2 " always have statusline
set nosc noru nosm " visual mods
set lazyredraw
set ignorecase " ignore case for search
set completeopt=menu,menuone,noselect,preview " complete options 

" Colorschemas --------------------------------------------------------------
" colorscheme darcula
" colorscheme darcula-solid
" colorscheme dracula 
" colorscheme gruvbox
" colorscheme neodark
colorscheme tokyodark
runtime ./plugins/configs/onedark.vim  " setup for colorscheme
" colorscheme onedark



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

" todo-comments.nvim
runtime ./plugins/configs/todo-comments.vim

" lualine
runtime ./plugins/configs/lualine.vim

" bufferline
runtime ./plugins/configs/bufferline.vim

" nvim-autopairs
runtime ./plugins/configs/nvim-autopairs.vim

" gitsings
runtime ./plugins/configs/gitsigns.vim

" indexLine
runtime ./plugins/configs/indentLine.vim

" dashboard
runtime ./plugins/configs/dashboard.vim

" gomove
runtime ./plugins/configs/gomove.vim

" cursorline
runtime ./plugins/configs/nvim-cursorline.vim

" images
runtime ./plugins/configs/nvim-images.vim


" Native LSP ----------------------------------------------------------------

" Mason ex. lspinstaller
runtime ./plugins/configs/mason.vim

" LSP configurations
runtime ./plugins/configs/lspconfig.vim

" nvim-cmp
runtime ./plugins/configs/nvim-cmp.vim

" nvim-treesitter
runtime ./plugins/configs/nvim-treesitter.vim

" trouble.nvim
runtime ./plugins/configs/trouble.vim

" lspsaga
runtime ./plugins/configs/lspsaga.vim
