" === vim-syntastic/syntastic ===

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5               " height
let g:syntastic_auto_loc_list = 1                 " open errors when any
let g:syntastic_aggregate_errors = 1
" check on open may slow down
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = "\u2716"
let g:syntastic_warning_symbol = "\u26A0"

let g:syntastic_quiet_messages = {
  \ "regex":   '\m.*encoding US-ASCII$',
  \ "file:p":  ['\m^/usr/include/', '\m\c\.h$'] }

let g:syntastic_java_checkers = ['checkstyle', 'javac']
let g:syntastic_cs_checkers = ['code_checker']
