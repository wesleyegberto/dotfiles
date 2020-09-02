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

nnoremap <silent> <Leader>wfv <C-w>t<C-w>H   " flip vertical split to vertical
nnoremap <silent> <Leader>wfh <C-w>t<C-w>K   " flip horizontal split to horizontal

" tabs and buffers navigation
"nnoremap gt :bn<CR>
"nnoremap gT :bp<CR>
nnoremap gb :bnext<CR>
nnoremap gB :bprev<CR>
nnoremap <silent> <M-Right> :bn<CR>
nnoremap <silent> <M-Left> :bp<CR>
nnoremap <silent> <Leader>bp :bprevious<CR>
nnoremap <silent> <Leader>bn :bnext<CR>
nnoremap <silent> <Leader>bf :bfirst<CR>
nnoremap <silent> <Leader>bl :blast<CR>
nnoremap <silent> <Leader>bd :bd<CR>
nnoremap <silent> <Leader>bk :bw<CR>

" to allow navigate a line above and bellow correctly when word wrapping
nnoremap k gk
nnoremap j gj

" move to the start of line
nnoremap H ^
" move to the end of line
nnoremap L $

" redo
nnoremap U <C-r>

" insert mode shortcut
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>

cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" in macOS: ∆ is <M-j>; ˚ is <M-k>; Ô is <M-J>;  is <M-K>; Ó is <M-H>; Ò is <M-L>
if has('osx')
  " <M-j> and <M-k> to move line up and down
  nnoremap <silent> ∆ :m .+1<CR>==
  nnoremap <silent> ˚ :m .-2<CR>==
  inoremap <silent> ∆ <Esc>:m .+1<CR>==gi
  inoremap <silent> ˚ <Esc>:m .-2<CR>==gi
  vnoremap <silent> ∆ :m '>+1<CR>gv=gv
  vnoremap <silent> ˚ :m '<-2<CR>gv=gv

  " Use alt + hjkl to resize windows
  nnoremap <silent> Ô :resize -5<CR>
  nnoremap <silent>  :resize +5<CR>
  nnoremap <silent> Ó :vertical resize -5<CR>
  nnoremap <silent> Ò :vertical resize +5<CR>

else
  " <M-j> and <M-k> to move line up and down
  nnoremap <silent> <M-j> :m .+1<CR>==
  nnoremap <silent> <M-k> :m .-2<CR>==
  inoremap <silent> <M-j> <Esc>:m .+1<CR>==gi
  inoremap <silent> <M-k> <Esc>:m .-2<CR>==gi
  vnoremap <silent> <M-j> :m '>+1<CR>gv=gv
  vnoremap <silent> <M-k> :m '<-2<CR>gv=gv

  " Use alt + hjkl to resize windows (Ô is <M-J>;  is <M-K>; Ó is <M-H>; Ò is <M-L>)
  nnoremap <silent> <M-J> :resize -5<CR>
  nnoremap <silent> <M-K> :resize +5<CR>
  nnoremap <silent> <M-H> :vertical resize -5<CR>
  nnoremap <silent> <M-L> :vertical resize +5<CR>
endif


" configure whick-key to display after leader key is pressed and not other key is pressed
set timeoutlen=500
call which_key#register('\', "g:which_key_map")
nnoremap <silent> <Leader> :WhichKey '\'<CR>
