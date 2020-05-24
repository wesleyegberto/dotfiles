" === vim-airline/vim-airline ===

let g:airline#extensions#tabline#enabled = 1                          " automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#fnamemod = ':t'                      " Show just the filename
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'   " path formatter

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode
