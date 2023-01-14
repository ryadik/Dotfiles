" Common --------------------------------------------------------------------
" remap leader key
let mapleader=" "
:verbose inoremap <Tab>
" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" remove highlight after searching
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
" buffer navigation
nnoremap <TAB> :bn<cr>
nnoremap <S-TAB> :bp<cr>
nnoremap <c-w> :bp \|bd #<cr>
" reload vim
nnoremap <c-u> :w<cr>:%so<cr>
vnoremap <c-u> :w<cr>:%so<cr>
inoremap <c-u> :w<cr>:%so<cr>

" Todo comments -------------------------------------------------------------
nnoremap <leader>td <cmd>TodoTrouble<cr>


" NvimTree
nnoremap <C-n> <cmd>NvimTreeToggle<cr>
vnoremap <C-n> <cmd>NvimTreeToggle<cr>
inoremap <C-n> <cmd>NvimTreeToggle<cr>
nnoremap <leader>ntf <cmd>NvimTreeFindFile<cr>
vnoremap <leader>ntf <cmd>NvimTreeFineFile<cr>
inoremap <leader>ntf <cmd>NvimTreeFindFile<cr>


" Telescope -----------------------------------------------------------------
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
" pickers
nnoremap <leader>lca <cmd>lua require'telescope.builtin'.lsp_code_actions{}<cr>
nnoremap <leader>lgr <cmd>lua require'telescope.builtin'.lsp_references{}<cr>
nnoremap <leader>lgd <cmd>lua require'telescope.builtin'.lsp_definitions{}<cr>


" Renamer
inoremap <silent> <F2> <cmd>lua require('renamer').rename()<cr>


" Gitsigns
nnoremap <leader>Gbl <cmd>lua require"gitsigns".blame_line{full=true}<CR>
nnoremap <leader>Gtbl <cmd>Gitsigns toggle_current_line_blame<CR>
nnoremap <leader>Gd <cmd>Gitsigns diffthis<CR>

 
" Gomove
nmap <left> <Plug>GoNSMLeft
nmap <down> <Plug>GoNSMDown
nmap <up> <Plug>GoNSMUp
nmap <right> <Plug>GoNSMRight

xmap <left> <Plug>GoVSMLeft
xmap <down> <Plug>GoVSMDown
xmap <up> <Plug>GoVSMUp
xmap <right> <Plug>GoVSMRight


" LSP -----------------------------------------------------------------------
" inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
" inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
" mapping for compelition is here -> plugins/configs/nvim-cpm.vim 20:1


" Trouble -------------------------------------------------------------------
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>


" Lspaga --------------------------------------------------------------------
nnoremap <silent><leader>lf :Lspsaga lsp_finder<CR>

nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>

nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

nnoremap <silent><leader>ls :Lspsaga signature_help<CR>

nnoremap <silent><leader>rn :Lspsaga rename<CR>

nnoremap <silent><leader>gd :Lspsaga peek_definition<CR>

nnoremap <silent> <leader>ld :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> [d :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]d :Lspsaga diagnostic_jump_prev<CR>

nnoremap <silent> <A-d> <cmd>Lspsaga open_floaterm<CR>
