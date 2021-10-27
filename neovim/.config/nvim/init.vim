" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'airblade/vim-gitgutter'

Plug 'christoomey/vim-tmux-navigator'

Plug 'kyazdani42/nvim-web-devicons'

Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'akinsho/bufferline.nvim'
Plug 'Yggdroot/indentLine' 
Plug 'nvim-lualine/lualine.nvim'

Plug 'morhetz/gruvbox'
Plug 'doums/darcula'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'preservim/vim-wheel'

" Initialize plugin system
call plug#end()

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
" Better display for messages 
set cmdheight=2 
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set laststatus=2
set nosc noru nosm
set lazyredraw
set ignorecase


"colorscheme darcula
colorscheme dracula 


" MAPPINGS

" remap leader key
let mapleader=" "
:verbose inoremap <Tab>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap ,<space> :nohlsearch<CR>

" shift+arrow selection
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>

" cut, copy, paste, undo
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
map <C-v> pi
imap <C-v> <Esc>pi
imap <C-z> <Esc>ui

" навигация в буфферах (табах)
nnoremap <TAB> :bn<cr>
nnoremap <S-TAB> :bp<cr>
nnoremap <c-w> :bp \|bd #<cr>

inoremap jk <ESC>

" telescope
" files
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fbr <cmd>Telescope file_browser hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>hk <cmd>Telescope keymaps<cr>
" buffers
nnoremap <leader>fbu <cmd>Telescope buffers<cr>
nnoremap <leader>bff <cmd>Telescope current_buffer_fuzzy_find<cr>
" colorschemes
nnoremap <leader>th <cmd>Telescope colorscheme<cr>
" git
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>

" Use <c-space> to trigger completion.
" ctrl+space для срабатываня автокомплита
inoremap <silent><expr> <c-space> coc#refresh()

" END MAPPINGS


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



" COC
" coc config
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-vetur',
  \ ]

" Remap keys for gotos
autocmd FileType scss setl iskeyword+=@-@

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

let g:ale_completion_enabled = 0
let g:ale_linters = {'javascript': ['eslint']}
