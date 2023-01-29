" #########################################################
" # General mappings
" #########################################################

let g:mapleader = " "

" save buffer
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a
vmap <C-s> <Esc>:w<CR>

" unhighlight the search result
nnoremap <silent> <Leader><Esc> :nohl<CR>

" toggle wrap
nnoremap <silent> <Leader>ow :set wrap!<CR>


" change vertical split to horizontal
nnoremap <silent> <Leader>wfv <C-w>t<C-w>H
" change horizontal split to vertical
nnoremap <silent> <Leader>wfh <C-w>t<C-w>K

" tabs and buffers navigation
nnoremap gb :bnext<CR>
nnoremap gB :bprev<CR>
nnoremap <silent> <M-Right> :bn<CR>
nnoremap <silent> <M-Left> :bp<CR>
nnoremap <silent> <Leader>bf :Buffers<CR>
nnoremap <silent> <Leader>bp :bprevious<CR>
nnoremap <silent> <Leader>b
nnoremap <silent> <Leader>bd :bd<CR>

" paste over selection without yank it:
" paste and stay at the end of selection
vnoremap p "_dP
" paste and go to beginning of selection
vnoremap P "_dP`[
" yank until end of line
nnoremap Y y$
" redo
nnoremap U <C-r>

" go to last character in the line (will keep EOL)
nnoremap $ g_
" keep selection after indenting
noremap < <gv
noremap > >gv
" reselect either the last pasted or changed text
noremap gV `[v`]

" on insert mode, jk as Esc (we can use <C-[>
if !exists('g:vscode')
  inoremap jk <Esc>
endif

" to allow navigate a line above and bellow correctly when word wrapping
nnoremap k gk
nnoremap j gj

" move to the start of line
nnoremap H ^
" move to the end of line
nnoremap L $

" keep the cursor position - don't move to next match
nmap * *N
" when searching next/previous word, put it on center and unfold if needed
nnoremap n nzzzv
nnoremap N Nzzzv
" when joining lines, keep the cursor in location before the join
nnoremap J mzJ`z

" register with C-g to allow ugdo break points (instead of whole thing)
if !exists("g:vscode")
  inoremap , ,<C-g>u
  inoremap . .<C-g>u
  inoremap ! !<C-g>u
  inoremap ? ?<C-g>u
  inoremap { {<C-g>u
  inoremap } }<C-g>u
  inoremap ( (<C-g>u
  inoremap ) )<C-g>u
endif

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
