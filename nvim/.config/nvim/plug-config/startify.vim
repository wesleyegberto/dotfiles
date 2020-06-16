" === mhinz/vim-startify ===

let g:startify_custom_header = [
  \ '    _  __     _      ',
  \ '   / |/ /  __(_)_ _  ',
  \ '  /    / |/ / /  ` \ ',
  \ ' /_/|_/|___/_/_/_/_/ ',
  \]

" :SLoad       load a session
" :SSave[!]    save a session
" :SDelete[!]  delete a session
" :SClose      close a session

" Don't change to directory when selecting a file
let g:startify_files_number = 5
let g:startify_change_to_dir = 0
let g:startify_custom_header = [ ]
let g:startify_relative_path = 1
let g:startify_use_env = 1

" Custom startup list, only show MRU from current directory/project
let g:startify_lists = [
  \ { 'type': 'dir',       'header': [ 'Files '. getcwd() ] },
  \ { 'type': 'sessions',  'header': [ 'Sessions' ]       },
  \ { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      },
  \ { 'type': 'commands',  'header': [ 'Commands' ]       },
  \ ]

let g:startify_commands = [
  \ { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
  \ { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
  \ ]

let g:startify_bookmarks = [
  \ { 'v': '~/.config/nvim/init.vim' },
  \ { 'z': '~/.zshrc' },
  \ { 'g': '~/.gitconfig' }
  \ ]

autocmd User Startified setlocal cursorline
nmap <Leader>S :Startify<cr>
