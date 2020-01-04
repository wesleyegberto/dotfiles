" Wesley's VIM setup
" Install the Plugin Manager
" git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
" 
" cp ~/.vimrc ~/.config/nvim/init.vim
" Inspiration: https://github.com/nicknisi/dotfiles/blob/master/config/nvim/init.vim

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

" Insert all Plugins inside this block
call vundle#begin()

" Package manager (use vim +PluginInstall +qall)
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


filetype plugin indent on       " load file type plugins + indent
syntax enable

set t_Co=256                    " explicitly tell vim that the terminal supports 256 colors

set nocompatible                " no compatibility with vi
set encoding=utf-8

set clipboard=unnamed           " copy to OS clipboard

if has('mouse')                 " enable mouse if possible
  set mouse=a
endif

if has('shodcmd')
  set shodcmd                     " display incomplete commands
endif


set number relativenumber       " show relative number of lines to the current line

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
set foldmethod=syntax           " fold based on indent
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


filetype plugin indent on

" ----- jistr/vim-nerdtree-tabs ----- {{
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
" }}

" ----- justinmk/vim-sneak ----- {{
  let g:sneak#label = 1
" }}

" ----- machakann/vim-highlightedyank ----- {{
  let g:highlightedyank_highlight_duration = 1000     " Highlight the content copied
" }}

" ----- jeffkreeftmeijer/vim-numbertoggle ----- {{
  " hybrid mode (normal mode: relative, insert mode: absolute)
  :augroup numbertoggle
  :  autocmd!
  :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  :augroup END
" }}

" ----- airblade/vim-gitgutter settings ----- {{
  " In vim-airline, only display "hunks" if the diff is non-zero
  let g:airline#extensions#hunks#non_zero_only = 1
" }}

" ----- Raimondi/delimitMate settings ----- {{
  let delimitMate_expand_cr = 1
  augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
  augroup END
" }}

" ----- mhinz/vim-startify ----- {{
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
" }}