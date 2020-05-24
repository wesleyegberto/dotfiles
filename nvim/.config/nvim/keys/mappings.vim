" #########################################################
" # General mappings
" #########################################################

let g:mapleader = "\\"            " leader key to \

" nmap <space> \                  " space to \
" xmap <space> \                  " space to \

nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a
vmap <C-s> <Esc>:w<CR>

imap jj <Esc>                   " on insert mode, jj as Esc (we can use <C-[>

nnoremap <Leader>wth <C-w>t<C-w>H   " flip vertical split to horizontal
nnoremap <Leader>wtk <C-t>t<C-w>K   " flip horizontal split to vertical

nnoremap <C-w>th <C-w>t<C-w>H       " flip vertical split to horizontal
nnoremap <C-w>tk <C-t>t<C-w>K       " flip horizontal split to vertical

" to allow navigate a line above and bellow correctly when word wrapping
nnoremap k gk
nnoremap j gj

" tabs and buffers navigation
"nnoremap gt :bn<CR>
"nnoremap gT :bp<CR>
nnoremap gb :bnext<CR>
nnoremap gB :bprev<CR>
nnoremap <silent> <M-Right> :bn<CR>
nnoremap <silent> <M-Left> :bp<CR>


" configure whick-key to display after leader key is pressed and not other key is pressed
set timeoutlen=500
call which_key#register('\', "g:which_key_map")
nnoremap <silent> <Leader> :WhichKey '\'<CR>

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>
