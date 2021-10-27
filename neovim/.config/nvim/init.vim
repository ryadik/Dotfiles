" Plugins -------------------------------------------------------------------
runtime ./plugins/plug.vim


" Settings ------------------------------------------------------------------
set mouse=a
set number
set hidden
set cursorline
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


"colorscheme darcula
colorscheme dracula 


" Mappings ------------------------------------------------------------------
runtime ./map.vim


" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile


" lualine
lua << END
require'lualine'.setup()
END


" bufferline
lua << END
require("bufferline").setup{
  diagnostics = "coc"
}
END


" indentLine
let g:indentLine_fileTypeExclude=['json', 'md', 'markdown']


" vim-wheel
let g:wheel#map#up = '<c-k>'
let g:wheel#map#down = '<c-j>'
let g:wheel#map#mouse = 1
let g:wheel#line#threshold = 5


" ale
let g:ale_completion_enabled = 0
let g:ale_linters = {'javascript': ['eslint']}


" Coc -----------------------------------------------------------------------
runtime ./plugins/configs/coc.vim
