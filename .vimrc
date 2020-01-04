" ########################################################
" # Wesley's VIM setup
" ########################################################
" cp ~/.vimrc ~/.config/nvim/init.vim

" My mappgings:
" \st         " Show startify

" C-p         " fuzzy finder (ctrlpvim/ctrlp.vim)

" \t          " toggle nerdtree
" F2          " toggle nerdtree
" \y          " reveal file in nerdtree

" C-\         " go previous window
" C-h         " left window
" C-j         " down window
" C-k         " up window
" C-l         " right window
" :q<index>   " close window with index

" C-n         " find word occurrences (like VSCode C-d)
" %           " jump to matching () or {} or []

" ########################################################
" # Instructions
" ########################################################

" Install the Plugin Manager:
" git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
" Install the plugins:
" vim +PluginInstall +qall


filetype off

set rtp+=~/.vim/bundle/Vundle.vim

" ########################################################
" # Plugin installations
" ########################################################

" Insert all Plugins inside this block
call vundle#begin()

" Package manager
Plugin 'VundleVim/Vundle.vim'

" tmux integration for vim
Plugin 'benmills/vimux'

" To navigate between open pages with ctrl and hjkl (C-h C-j C-k C-k)
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" Hybrid between number (when editing) and relative number (when navigating)
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

" nicer status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" features: open file, switch between buffers, change current dir (we must define the mappings)
" dependency: pip3 install --user pynvim
" Plugin 'Shougo/denite.nvim'

" jump to any location specified by two characters
Plugin 'justinmk/vim-sneak'

Plugin 'machakann/vim-highlightedyank'

" Show git info at line
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Fuzzy find (like Sublime)
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'terryma/vim-multiple-cursors'

" automatic closing of quotes, parenthesis, brackets, etc
Plugin 'Raimondi/delimitMate'

" mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens
Plugin 'tpope/vim-surround'

" better terminal integration (substitute, search, and abbreviate multiple variants of a word)
Plugin 'tpope/vim-abolish'

" enables repeating other supported plugins with the . command
" Pluging 'tpope/vim-repeat'

" Intellisense JS engine
" Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" Startify: Fancy startup screen for vim
Plugin 'mhinz/vim-startify'

call vundle#end()



" ########################################################
" # General mappings
" ########################################################

let g:mapleader = "\\"          " leader key to \

nmap <space> \                  " space to \
xmap <space> \                  " space to \

filetype plugin indent on       " load file type plugins + indent (nvim always on)
syntax enable

set t_Co=256                    " explicitly tell vim that the terminal supports 256 colors

set nocompatible                " no compatibility with vi
set encoding=utf-8


set clipboard=unnamed           " copy to OS clipboard

if has('mouse')                 " enable mouse if possible
  set mouse=a
endif

set number relativenumber       " show relative number of lines to the current line
set noshowmode                  " airline will do the job
set showcmd                     " display incomplete commands

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set nolazyredraw                " don't redraw while executing macros

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are insensitive
set smartcase                   " unless they contain at least one capital letter

set smartindent

set ls=2                        " always show status bar
set number                      " show line numbers
set cursorline                  " display a marker on current line
" colorscheme railscasts          " set colorscheme

" Code folding settings
set foldmethod=manual           " fold based on indent
set foldlevelstart=99
set foldnestmax=10              " deepest fold is 10 levels
set nofoldenable                " don't fold by default
set foldlevel=1

" Toggle invisible characters
" set list
" set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
" set showbreak=↪


set completeopt=menuone,longest,preview             " simple autocomplete for anything
set wildmode=list:longest,full                      " autocomplete for paths and files
set wildignore+=.git                                " ignore these extensions on autocomplete

" Highlight the content to replace before doing it without spliting
" set inccommand=nosplit


" ---- neoclide/coc.nvim -----
set hidden                                          " if hidden is not set, TextEdit might fail.

set nobackup                                        " Some servers have issues with backup files, see #649
set nowritebackup

set cmdheight=2                                     " Better display for messages

set updatetime=300                                  " You will have bad experience for diagnostic messages when it's default 4000.
set shortmess+=c                                    " don't give |ins-completion-menu| messages.
set signcolumn=yes                                  " always show signcolumns

inoremap <silent><expr> <c-space> coc#refresh()     " Use <c-space> to trigger completion.



" ########################################################
" # Appearance
" ########################################################

" Appearence
set background=dark
" colorscheme one                 " atom one dark
"   call one#highlight('vimTodo', '000000', 'ffec8b', 'none')



" ########################################################
" # Plugins configuration
" ########################################################

filetype plugin indent on

" ----- jistr/vim-nerdtree-tabs ----- {{{
  let g:nerdtree_tabs_open_on_console_startup = 1     " To have NERDTree always open on startup

  set switchbuf+=usetab,newtab
  set wrapscan
  let g:WebDevIconsOS = 'Darwin'
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:DevIconsEnableFoldersOpenClose = 1
  let g:DevIconsEnableFolderExtensionPatternMatching = 1
  let NERDTreeDirArrowExpandable = "\u00a0"           " make arrows invisible
  let NERDTreeDirArrowCollapsible = "\u00a0"          " make arrows invisible
  let NERDTreeNodeDelimiter = "\u263a"                " smiley face

  map <F2> :NERDTreeToggle<CR>                        " F2 to toggle nerdtree
  nmap <silent> <leader>t :NERDTreeTabsToggle<CR>     " Open/close NERDTree Tabs with \t
  nmap <silent> <leader>y :NERDTreeFind<cr>           " reveal the current file in nerdtree

  let NERDTreeShowHidden=1
  let NERDTreeDirArrowExpandable = '▷'
  let NERDTreeDirArrowCollapsible = '▼'
  let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "✹",
  \ "Staged"    : "✚",
  \ "Untracked" : "✭",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ 'Ignored'   : '☒',
  \ "Unknown"   : "?"
  \ }
" }}}

" ----- Shougo/denite.nvim ----- {{{
"  " Define mappings
"  autocmd FileType denite call s:denite_my_settings()
"  function! s:denite_my_settings() abort
"    " nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
"    " nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
"    " nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
"    " nnoremap <silent><buffer><expr> q denite#do_map('quit')
"    " nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
"    " nnoremap <silent> <leader>p denite#do_map('open_filter_buffer')
"    " nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
"  endfunction
" }}}

" ----- vim-airline/vim-airline ----- {{{
  let g:airline#extensions#tabline#enabled = 1                          " automatically displays all buffers when there's only one tab open
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#formatter = 'unique_tail_improved'   " path formatter
" }}}

" ----- justinmk/vim-sneak ----- {{{
  let g:sneak#label = 1
" }}}

" ----- machakann/vim-highlightedyank ----- {{{
  let g:highlightedyank_highlight_duration = 1000     " Highlight the content copied
" }}}

" ----- jeffkreeftmeijer/vim-numbertoggle ----- {{{
  " hybrid mode (normal mode: relative, insert mode: absolute)
  :augroup numbertoggle
  :  autocmd!
  :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  :augroup END
" }}}

" ----- airblade/vim-gitgutter settings ----- {{{
  " In vim-airline, only display "hunks" if the diff is non-zero
  let g:airline#extensions#hunks#non_zero_only = 1
" }}}

" ----- Raimondi/delimitMate settings ----- {{{
  let delimitMate_expand_cr = 1
  augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
  augroup END
" }}}

" ----- mhinz/vim-startify ----- {{{
  " Don't change to directory when selecting a file
  let g:startify_files_number = 5
  let g:startify_change_to_dir = 0
  let g:startify_custom_header = [ ]
  let g:startify_relative_path = 1
  let g:startify_use_env = 1

  " Custom startup list, only show MRU from current directory/project
  let g:startify_lists = [
  \  { 'type': 'dir',       'header': [ 'Files '. getcwd() ] },
  \  { 'type': function('helpers#startify#listcommits'), 'header': [ 'Recent Commits' ] },
  \  { 'type': 'sessions',  'header': [ 'Sessions' ]       },
  \  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      },
  \  { 'type': 'commands',  'header': [ 'Commands' ]       },
  \ ]

  let g:startify_commands = [
  \   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
  \   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
  \ ]

  let g:startify_bookmarks = [
      \ { 'c': '~/.config/nvim/init.vim' },
      \ { 'g': '~/.gitconfig' },
      \ { 'z': '~/.zshrc' }
  \ ]

  autocmd User Startified setlocal cursorline
  nmap <leader>st :Startify<cr>
" }}}