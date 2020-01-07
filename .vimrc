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
" vim +PluginInstall +UpdateRemotePlugins +qall

" Dependencies:
" pip2 install --user pynvim
" pip3 install --user pynvim
" pip2 install --user neovim
" pip3 install --user neovim

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath+=~/.vim/bundle/LanguageClient-neovim

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

    "display which keybindings is available
    Plugin 'liuchengxu/vim-which-key'

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

    " intellisense
    Plugin 'neoclide/coc.nvim', {'branch': 'release'}

    Plugin 'artur-shaik/vim-javacomplete2'

    Plugin 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

    " Startify: Fancy startup screen for vim
    Plugin 'mhinz/vim-startify'

call vundle#end()



" ########################################################
" # General mappings
" ########################################################

" ----- liuchengxu/vim-which-key' ----- {{{
  let g:which_key_map = {}

  let g:which_key_map.s = { 'name' : '+startify' }
  let g:which_key_map.s.t = [ '\\st', 'show startify' ]

  let g:which_key_map.w = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'q' : ['<C-W>q'     , 'quit-window']           ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : ['resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : ['resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-aside']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }

  let g:which_key_map.l = {
      \ 'name' : '+lsp',
      \ 'f' : ['LanguageClient#textDocument_formatting()'        , 'formatting'],
      \ 'h' : ['LanguageClient#textDocument_hover()'             , 'hover'],
      \ 'r' : ['LanguageClient#textDocument_references()'        , 'references'],
      \ 'R' : ['LanguageClient#textDocument_rename()'            , 'rename'],
      \ 's' : ['LanguageClient#textDocument_documentSymbol()'    , 'document-symbol'],
      \ 'S' : ['LanguageClient#workspace_symbol()'               , 'workspace-symbol'],
      \ 'g' : {
          \ 'name': '+goto',
          \ 'd' : ['LanguageClient#textDocument_definition()'      , 'definition'],
          \ 't' : ['LanguageClient#textDocument_typeDefinition()'  , 'type-definition'],
          \ 'i' : ['LanguageClient#textDocument_implementation()'  , 'implementation'],
          \ },
      \ }
" }}}



" ########################################################
" # General mappings
" ########################################################

let g:mapleader = "\\"          " leader key to \

nmap <space> \                  " space to \
xmap <space> \                  " space to \

imap jj <Esc>                   " on insert mode, jj as Esc

" configure whick-key to display after leader key is pressed and not other key is pressed
set timeoutlen=1000
call which_key#register('\', "g:which_key_map")
nnoremap <silent> <leader> :WhichKey '\'<CR>

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


set hidden                                          " if hidden is not set, TextEdit might fail.

set nobackup                                        " Some servers have issues with backup files, see #649
set nowritebackup

set cmdheight=2                                     " Better display for messages

set updatetime=300                                  " You will have bad experience for diagnostic messages when it's default 4000.
set shortmess+=c                                    " don't give |ins-completion-menu| messages.
set signcolumn=yes                                  " always show signcolumns



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
  let g:LanguageClient_serverCommands = {
      \ 'java': ['java',
          \ '-Declipse.application=org.eclipse.jdt.ls.core.id1',
          \ '-Dosgi.bundles.defaultStartLevel=4',
          \ '-Declipse.product=org.eclipse.jdt.ls.core.product',
          \ '-Dlog.level=ALL',
          \ '-noverify',
          \ '-Dfile.encoding=UTF-8',
          \ '-Xms1G',
          \ '-jar',
          \ expand('~/dev-tools/ide/jdt-language-server/plugins/org.eclipse.equinox.launcher_1.5.600.v20191014-2022.jar'),
          \ '-configuration',
          \ expand('~/dev-tools/ide/jdt-language-server/config_mac'),
          \ '-data',
          \ getcwd()
          \ ],
      \ 'python': ['/usr/local/bin/pyls'],
      \ }

  nnoremap <F5> :call LanguageClient_contextMenu()<CR>
  " or map each action separately
  " nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  " nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  " nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" }}}


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

  map <F2> :NERDTreeToggle<CR>                        " toggle NERDTree Tabs
  nmap <silent> <leader>t :NERDTreeTabsToggle<CR>     " toggle NERDTree Tabs
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

" ----- artur-shaik/vim-javacomplete2 ----- {{{
  autocmd FileType java setlocal omnifunc=javacomplete#Complete

  nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
  imap <F4> <Plug>(JavaComplete-Imports-AddSmart)


" }}}

" ----- neoclide/coc.nvim ----- {{{
  inoremap <silent><expr> <c-space> coc#refresh()             " use <c-space> to trigger completion

  " use <tab> for trigger completion and navigate to next complete item
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  " close preview window when completion is done.
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

  " use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction
  
  nmap <leader>rn <Plug>(coc-rename)                          " remap for rename current word

  " Remap for format selected region
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)

" }}}
