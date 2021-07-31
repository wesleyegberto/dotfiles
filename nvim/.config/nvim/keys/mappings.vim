" #########################################################
" # General mappings
" #########################################################

let g:mapleader = " "            " leader key

" save buffer
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a
vmap <C-s> <Esc>:w<CR>

inoremap jj <Esc>                   " on insert mode, jj as Esc (we can use <C-[>

nmap <Leader><Esc> :nohlsearch<CR>

nnoremap <silent> <Leader>wfv <C-w>t<C-w>H   " change vertical split to horizontal
nnoremap <silent> <Leader>wfh <C-w>t<C-w>K   " change horizontal split to vertical

" tabs and buffers navigation
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

nnoremap Y y$

" redo
nnoremap U <C-r>

" when searching next/previous word, put it on center and unfold if needed
nnoremap n nzzzv
nnoremap N Nzzzv
" when joining lines, keep the cursor in location before the join
nnoremap J mzJ`z

" register with C-g to allow undo break points (instead of whole thing)
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap { {<C-g>u
inoremap } }<C-g>u
inoremap ( (<C-g>u
inoremap ) )<C-g>u

" insert lines jumps to jumplist (to be accessed with C-o)
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'

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
