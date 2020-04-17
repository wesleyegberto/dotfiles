" #########################################################################
" # ____    __    ____  _______     _______. __       ___________    ____ #
" # \   \  /  \  /   / |   ____|   /       ||  |     |   ____\   \  /   / #
" #  \   \/    \/   /  |  |__     |   (----`|  |     |  |__   \   \/   /  #
" #   \            /   |   __|     \   \    |  |     |   __|   \_    _/   #
" #    \    /\    /    |  |____.----)   |   |  `----.|  |____    |  |     #
" #     \__/  \__/     |_______|_______/    |_______||_______|   |__|     #
" # VIM Setup                                                             #
" #########################################################################
" cp ~/.vimrc ~/.config/nvim/init.vim


" #########################################################
" # Keybinding Mappgin
" #########################################################

" \st          " Show startify

" \t           " toggle nerdtree
" \y           " reveal file in nerdtree

" On NERDTree tab
" m            " Show menu
" t            " open the selected file in a new tab
" i            " open the selected file in a horizontal split window
" s            " open the selected file in a vertical split window
" I            " toggle hidden files
" m            " show the NERD Tree menu
" R            " refresh the tree, useful if files change outside of Vim
" ?            " toggle NERD Tree's quick help


" === Windows and Tabs ===
" <C-w>s       " split current window horizontally (alternative :split)
" <C-w>v       " rplit current window vertically (alternative :vsplit)
" <C-w>c       " close current window
" <C-w>q       " close current window
" <C-w>w       " Jump to the next window
" <C-w>#<      " Shrink/resize current window from the right by # (default 1)
" <C-w>#>      " Increase/resize current window to the right by # (default 1)
" <C-w><ARROW> " Jump to window left/right/top/bottom (arrow keys) to the current

" <C-\>        " go previous window
" <C-h>        " left window
" <C-j>        " down window
" <C-k>        " up window
" <C-l>        " right window
" :q<index>    " close window with index

" gt           " go to next tab
" gT           " go to previous tab
" #gt          " go to tab at index #
" gb or ]b     " go to next buffer
" gB or [b     " go to previous buffer


" === Searching ===
" C-p         " fuzzy finder
" \b          " display all buffers to select (hjkl to navigate, <C-s> :sv, <C-v> :vs)
" \B           " list the tabs for selection
" \<Space>    " clear searching results
" *           " find current word and jump next occurrence
" [i          " show first occurrence of current word
" [I          " show all occurrences of current word


" === Navigation ===
" g;          " go to last edition position
" %           " jump to matching () or {} or []
" {           " go to previous paragraph
" }           " go to next paragraph
" [/          " go to start of first comment block /* */
" ]/          " go to end of first comment block /* */

" # terryma/vim-multiple-cursors
" <M-n>         " start multicursor and directly select all matches
" <C-n>         " start multicursor and add a virtual cursor + selection on the match
" After <C-n>:
" <C-n>         " add a new virtual cursor + selection on the next match
" <C-x>         " skip the next match
" <C-p>         " remove current virtual cursor + selection and go back on previous match

" enclosing navigation (between [], (), {})
" [%          " go to previous enclosing [ or ( or {
" ]%          " go to next enclosing ] or ) or }
" [{          " go to enclosing {
" ]}          " go to enclosing }
" [(          " go to enclosing (
" ])          " go to enclosing )
" [m          " go to start of previous body
" ]m          " go to start of next body

" git changes navigation
" [c          " go to previous git change
" ]c          " go to next git change

" diagnostic navigation
" [g          " navigate to previous diagnostic
" ]g          " navigate to next diagnostic


" === tpope/vim-unimpaired ===
" [e          " move current line above
" ]e          " move current line bellow
" <M-Up>      " move current line above
" <M-Down>    " move current line bellow
" [<Space>    " add blankline before current line
" ]<Space>    " add blankline after current line
" >p          " paste after linewise, increasing indent
" >P          " paste before linewise, increasing indent
" <p          " paste after linewise, decreasing indent
" <P          " paste before linewise, decreasing indent
" =p          " paste after linewise, reindenting
" =P          " paste linewise, reindenting
" [f          " go to the file preceding the current one
" ]f          " go to the file succeeding the current one


" === tpope/vim-surround ===
" using { ( [ will wrap the content with a space between the {} () []
" using `}`, `]`, `)` will wrap the content with no space
" format: `cs<CHAR_TO_REPLACE><CONTENT_REPLACE><cr>`
" Examples:
" cs"'        " replace surrounding the " to '
" ds"         " delete surrounding "
" yss)        " wrap the line with ()
" yss}        " wrap the line with {}
" ysiw]       " wrap the current word (iw -> inner word) with ]


" === coc-vim and omnisharp-vim keybindings ===
" <C-Space>   " refresh autocomplete (INSERT MODE)
" \qf         " quick fix for current line
" gd          " go to definition
" gi          " go to implementation
" gD          " peek definition
" gI          " peek implementation
" gr          " find references
" \crn         " rename var

" === coc-vim keybindings ===
" gy          " go to type
" \cd         " show documentation
" \cf         " format buffer
" \csf        " format selection

" actions (after \a we can cursor motion to select a block - like w or p)
" \cas         " if we have a selection otherwise we will need to provide a cursor motion to select a block (like: `\cas` -> action for current sentence)
" \cal         " action for current line
" \caw         " action for current word

" snippets
" <C-l>       " cut the selected content to use inside a snippet (when used later)
" <C-n>       " next item
" <C-p>       " previous item


" === liuchengxu/vim-which-key' === {{{
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
        \ 'f' : ['LanguageClient#textDocument_formatting()'           , 'formatting'],
        \ 'h' : ['LanguageClient#textDocument_hover()'                , 'hover'],
        \ 'r' : ['LanguageClient#textDocument_references()'           , 'references'],
        \ 'R' : ['LanguageClient#textDocument_rename()'               , 'rename'],
        \ 's' : ['LanguageClient#textDocument_documentSymbol()'       , 'document-symbol'],
        \ 'S' : ['LanguageClient#workspace_symbol()'                  , 'workspace-symbol'],
        \ 'g' : {
            \ 'name': '+goto',
            \ 'd' : ['LanguageClient#textDocument_definition()'       , 'definition'],
            \ 't' : ['LanguageClient#textDocument_typeDefinition()'   , 'type-definition'],
            \ 'i' : ['LanguageClient#textDocument_implementation()'   , 'implementation'],
            \ },
        \ }

    let g:which_key_map.a = {
        \ 'name': 'Coc-Nvim Actions',
        \ 'a'  : ['coc-codeaction-selected'                           , 'action-current-selection'],
        \ 'ac' : ['coc-codeaction'                                    , 'action-current-line'],
        \ }
" }}}


" #########################################################
" # Instructions
" #########################################################

" Install the Plugin Manager:
" git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
" Install the plugins:
" `vim +PluginInstall +UpdateRemotePlugins +qall`

" Dependencies:
" `pip2 install --user pynvim`
" `pip3 install --user pynvim`

" Actions for Coc-Vim
" on error: `:call coc#util#install()`
" actions popup: `:CocInstall coc-actions`
" java: `:CocInstall coc-java`
" snippets: `:CocInstall coc-snippets`

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath+=~/.vim/bundle/LanguageClient-neovim

" #########################################################
" # Plugin installations
" #########################################################

" Insert all Plugins inside this block
call vundle#begin()
    
    " tmux integration and navigate between open pages with C-h C-j C-k C-k
    Plugin 'benmills/vimux'
    Plugin 'christoomey/vim-tmux-navigator'

    "display which keybindings is available
    Plugin 'liuchengxu/vim-which-key'

    " nerdtree and tabs
    Plugin 'scrooloose/nerdtree'
    Plugin 'jistr/vim-nerdtree-tabs'
    Plugin 'Xuyuanp/nerdtree-git-plugin'

    " Hybrid between number (when editing) and relative number (when navigating)
    Plugin 'jeffkreeftmeijer/vim-numbertoggle'

    " fuzzy find (like Sublime)
    Plugin 'junegunn/fzf', { 'do': './install --bin' }
    Plugin 'junegunn/fzf.vim'

    Plugin 'jeetsukumaran/vim-buffergator'

    Plugin 'machakann/vim-highlightedyank'

    " Show git stuff and info at line
    Plugin 'tpope/vim-fugitive'
    Plugin 'airblade/vim-gitgutter'

    " better terminal integration (substitute, search, and abbreviate multiple variants of a word)
    Plugin 'tpope/vim-abolish'

    " Sublime-like multiple cursor editor
    Plugin 'terryma/vim-multiple-cursors'

    " plugin to facilitate navigation
    Plugin 'tpope/vim-unimpaired'
    Plugin 'easymotion/vim-easymotion'

    " mappings to easily delete, change and add such surroundings in {}, (), [], "", ''
    Plugin 'tpope/vim-surround'

    " autoclose and actions to insert spaces or new line between {}, (), []
    Plugin 'jiangmiao/auto-pairs'

    " highlight trailing whitespaces
    Plugin 'ntpeters/vim-better-whitespace'

    " colorful pair of brackets
    Plugin 'frazrepo/vim-rainbow'

    " intellisense
    Plugin 'neoclide/coc.nvim', {'branch': 'release'}
    Plugin 'vim-syntastic/syntastic'

    " code checker for Java
    Plugin 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

    " code checker for C#
    Plugin 'OmniSharp/omnisharp-vim'
    " Plugin 'nickspoons/vim-sharpenup'

    " snippets (plugin and collection of snippets)
    Plugin 'honza/vim-snippets'
    Plugin 'SirVer/ultisnips'

    " Startify: Fancy startup screen for vim
    Plugin 'mhinz/vim-startify'

    " nicer status bar
    Plugin 'bling/vim-bufferline'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'

    " colorscheme
    " Plugin 'dracula/vim', { 'name': 'dracula' }
    " Plugin 'fmoralesc/molokayo'
    " Plugin 'joshdick/onedark.vim'
    " Plugin 'kyoz/purify', { 'rtp': 'vim' }
    " Plugin 'kaicataldo/material.vim'
    Plugin 'KeitaNakamura/neodark.vim'

    " devicons (should be loaded after the current plugins)
    Plugin 'ryanoasis/vim-devicons'
    Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
call vundle#end()



" #########################################################
" # Appearance
" #########################################################

syntax on

if (has('termguicolors'))
  set termguicolors
endif

" Appearence
set background=dark
let g:airline_theme='dark'

" let g:material_theme_style = 'palenight'
" let g:material_terminal_italics = 1
" colorscheme material

" let g:dracula_colorterm = 0
" let g:dracula_italic = 0
" colorscheme dracula
" color dracula

" let g:airline_theme='onedark'
" let g:onedark_terminal_italics = 1
" colorscheme onedark

let g:neodark#solid_vertsplit = 1
" let g:neodark#use_256color = 1
colorscheme neodark

" #########################################################
" # General mappings
" #########################################################

let g:mapleader = "\\"          " leader key to \

" nmap <space> \                  " space to \
" xmap <space> \                  " space to \

nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a
vmap <C-s> <Esc>:w<CR>

imap jj <Esc>                   " on insert mode, jj as Esc (we can use <C-[>

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

set t_Co=256                    " explicitly tell vim that the terminal supports 256 colors

set nocompatible                " no compatibility with vi
set encoding=utf-8

set hidden                      " to allow switch between buffers without save

set nobackup                    " Some servers have issues with backup files, see #649
set nowritebackup

set cmdheight=2                 " Better display for messages

set clipboard=unnamed           " copy to OS clipboard

if has('mouse')                 " enable mouse if possible
  set mouse=a
endif

set ls=2                        " always show status bar
set number relativenumber       " show relative number of lines to the current line
set cursorline                  " display a marker on current line
set noshowmode                  " airline will do the job
set showcmd                     " display incomplete commands

"" Whitespace and indentation
set nowrap                      " don't wrap lines
set expandtab!                  " by default not expand tab
set tabstop=4                   " a tab is two spaces (or set this to 4)
set shiftwidth=4
set softtabstop=4
set nolazyredraw                " don't redraw while executing macros
set smartindent

set backspace=indent,eol,start  " allow backspace over everything in isert mode

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are insensitive
set smartcase                   " unless they contain at least one capital letter
nnoremap <Leader><space> :nohlsearch<CR> " unhighlight the search result

" Code folding settings (use `zc`, `zo`, `zz`)
set foldmethod=manual           " fold based on indent
set nofoldenable                " don't fold by default
set foldlevel=1
set foldlevelstart=99
set foldnestmax=10              " deepest fold is 10 levels

" Toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" Autocomplete menu
set completeopt=menuone,longest,preview             " simple autocomplete for anything
set wildmenu
set wildmode=list:longest,full                      " autocomplete for paths and files
set wildignore+=.git                                " ignore these extensions on autocomplete
set wildignore+=.class
" set wildoptions=pum                                 " display popup
" set pumblend=10                                     " transparence

" Highlight the content to replace before doing it without spliting
" set inccommand=nosplit


set updatetime=1000                                 " You will have bad experience for diagnostic messages when it's default 4000
set shortmess+=c                                    " don't give |ins-completion-menu| messages
set signcolumn=yes                                  " always show signcolumns



" #########################################################
" # Languages configuration
" #########################################################
" filetype plugin on            " load file type agnostic settings (format: ~/.config/nvim/after/java.vim)
filetype plugin indent on       " load identation by file type

autocmd Filetype java         setlocal expandtab! tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype python       setlocal expandtab  tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype javascript   setlocal expandtab  tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype cs           setlocal expandtab! tabstop=4 shiftwidth=4 softtabstop=4



" #########################################################
" # Plugins configuration
" #########################################################


" === jistr/vim-nerdtree-tabs === {{{
" let g:nerdtree_tabs_open_on_console_startup = 2                       " open only if we are openning a folder
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_startup_cd = 0
let g:nerdtree_tabs_focus_on_files = 1

" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

nmap <silent> <Leader>t :NERDTreeMirrorToggle<CR>                     " toggle NERDTree Tabs
nmap <silent> <Leader>T :NERDTreeTabsClose<CR>                        " toggle NERDTree Tabs
nmap <silent> <Leader>y :NERDTreeFind<cr>                             " reveal the current file in nerdtree

set switchbuf=usetab,newtab
set wrapscan

let g:WebDevIconsOS = 'Darwin'                                        " https://github.com/ryanoasis/vim-devicons/pull/135
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let g:NERDTreeLimitedSyntax = 1                                       " avoid lag
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_airline_statusline = 1

let NERDTreeDirArrowExpandable = "\u00a0"                             " make arrows invisible
let NERDTreeDirArrowCollapsible = "\u00a0"                            " make arrows invisible
let NERDTreeNodeDelimiter = "\u263a"                                  " smiley face

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

let g:nerdtree_tabs_autoclose = 0
" }}}


" === vim-airline/vim-airline === {{{
let g:airline#extensions#tabline#enabled = 1                          " automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#fnamemod = ':t'                      " Show just the filename
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'   " path formatter
" }}}


" === junegunn/fzf.vim === {{{
let g:fzf_buffers_jump = 1                                            " [Buffers] Jump to the existing window if possible

nmap <silent> <C-p> :FZF<CR>
" }}}


" === jeetsukumaran/vim-buffergator === {{{
let g:buffergator_viewport_split_policy = 'B'                         " Use the right side of the screen

let g:buffergator_suppress_keymaps = 1
let g:buffergator_suppress_mru_switching_keymaps = 1

nmap <Leader>b :BuffergatorToggle<CR>
nmap <Leader>B :BuffergatorTabsToggle<CR>
" }}}


" === airblade/vim-gitgutter === {{{
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1
" }}}


" === jiangmiao/auto-pairs === {{{
" let g:AutoPairsMultilineClose = 0
" let g:AutoPairsMapSpace = 0                                         " disable extra space between {}, (), [] when pressing <space>
" }}}


" === machakann/vim-highlightedyank === {{{
let g:highlightedyank_highlight_duration = 1000                       " Highlight the content copied
" }}}

" === ntpeters/vim-better-whitespace === {{{
let g:strip_whitespace_on_save = 1
" }}}


" === jeffkreeftmeijer/vim-numbertoggle === {{{
" hybrid mode (normal mode: relative, insert mode: absolute)
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
" }}}


" === tpope/vim-unimpaired === {{{
nmap <M-Up> <Plug>unimpairedMoveUp
nmap <M-Down> <Plug>unimpairedMoveDown
" }}}


" === mhinz/vim-startify === {{{
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
nmap <Leader>st :Startify<cr>
" }}}


" === artur-shaik/vim-javacomplete2 === {{{
"  autocmd FileType java setlocal omnifunc=javacomplete#Complete
"
"  nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
"  imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" }}}


" === neoclide/coc.nvim === {{{
let g:coc_global_extensions = [ 'coc-actions', 'coc-java', 'coc-omnisharp' ]

inoremap <silent><expr> <c-space> coc#refresh()                       " use <c-space> to trigger completion

" colors
hi Pmenu      ctermbg=Gray  guibg=Gray  ctermfg=Black guifg=Black
hi PmenuSel   ctermbg=White guibg=White ctermfg=Black guifg=Black
hi PmenuThumb ctermbg=Black guibg=Black ctermfg=White guifg=White

hi CocErrorHighlight    ctermfg=Red   guifg=#000000
hi CocErrorSign         ctermfg=Red   guifg=#ff1100
hi CocErrorVirtualText  ctermfg=Red   guifg=#ff1100
hi CocErrorFloat        ctermfg=Black guifg=#000000
hi CocErrorLine         ctermbg=DarkGray  guibg=#1C2117

hi CocWarningHighlight  ctermfg=Yellow guifg=#ff922b
hi CocWarningFloat      ctermfg=Yellow guifg=#ff922b
" hi CocWarningLine       ctermfg=Yellow guifg=#ff922b

augroup coc_commands

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

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " close preview window when completion is done.
    autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

    " use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gr <Plug>(coc-references)

    " use K to show documentation in preview window
    nnoremap <silent> <Leader>cd :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    nmap <Leader>crn <Plug>(coc-rename)                                    " remap for rename current word

    " Remap for do codeAction of selected region, ex: `<Leader>aap` for current paragraph
    function! s:cocActionsOpenFromSelected(type) abort
      execute 'CocCommand actions.open ' . a:type
    endfunction

    " Remap for do codeAction of current line
    nmap <Leader>cal  :CocCommand actions.open<CR>
    " code action for the selected content
    xnoremap <Leader>cal :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
    " code action with motion
    nnoremap <Leader>ca :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

    " Fix autofix problem of current line
    nmap <Leader>qf  <Plug>(coc-fix-current)

    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')
    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    " use `:OR` for organize import of current buffer
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Remap for format selected region
    nmap <Leader>cf :call CocAction('format')<CR>
    xmap <Leader>csf <Plug>(coc-format-selected)
    nmap <Leader>csf <Plug>(coc-format-selected)

    " Show all diagnostics
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    " nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    " nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

    " # coc-snippets
    " :CocList snippets
    " :CocCommand snippets.editSnippets
    " :CocCommand snippets.openSnippetFiles

    " Use <C-l> for trigger snippet expand.
    imap <C-l> <Plug>(coc-snippets-expand)
    " Use <C-j> for select text for visual placeholder of snippet.
    vmap <C-j> <Plug>(coc-snippets-select)
    " Use <C-j> for jump to next placeholder, it's default of coc.nvim
    let g:coc_snippet_next = '<c-j>'
    " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    let g:coc_snippet_prev = '<c-k>'

    " Use <C-j> for both expand and jump (make expand higher priority.)
    imap <C-j> <Plug>(coc-snippets-expand-jump)

    inoremap <silent><expr> <TAB>
          \ pumvisible() ? coc#_select_confirm() :
          \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    let g:coc_snippet_next = '<tab>'

augroup END

" }}}


" === SirVer/ultisnips === {{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}


" === vim-syntastic/syntastic === {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cs_checkers = ['code_checker']
" }}}


" === OmniSharp/omnisharp-vim === {{{
let g:sharpenup_map_prefix = '\c'

let g:OmniSharp_selector_ui = 'fzf'

let g:OmniSharp_highlight_types = 3
let g:sharpenup_create_mappings = 0

" Fetch full documentation during omnicomplete requests (:OmniSharpDocumentation command)
let g:omnicomplete_fetch_full_documentation = 1

" Enable snippet completion
let g:OmniSharp_want_snippet=1

augroup csharp_commands

autocmd!

    " Show type information automatically when the cursor stops moving.
    " Note that the type is echoed to the Vim command line, and will overwrite
    " any other messages in this space including e.g. ALE linting messages.
    autocmd CursorHold *.cs OmniSharpTypeLookup

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> gi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> gD :OmniSharpPreviewDefinition<CR>
    autocmd FileType cs nnoremap <buffer> gI :OmniSharpPreviewImplementation<CR>
    autocmd FileType cs nnoremap <buffer> gr :OmniSharpFindUsages<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>cfs :OmniSharpFindSymbol<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>cfm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>gt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>cod :OmniSharpDocumentation<CR>

    autocmd FileType cs inoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>coqf :OmniSharpFixUsings<CR>

    " Rename with dialog
    autocmd FileType cs nnoremap <Leader>corn :OmniSharpRename<CR>
    autocmd FileType cs nnoremap <F2> :OmniSharpRename<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>

    autocmd FileType cs nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

    " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
    autocmd FileType cs nnoremap <Leader>cal :OmniSharpGetCodeActions<CR>

    " Run code actions with text selected in visual mode to extract method
    autocmd FileType cs xnoremap <Leader>cal :call OmniSharp#GetCodeActions('visual')<CR>

    " Start the omnisharp server for the current solution
    autocmd FileType cs nnoremap <Leader>css :OmniSharpStartServer<CR>
    autocmd FileType cs nnoremap <Leader>csr :OmniSharpRestartServer<CR>
    autocmd FileType cs nnoremap <Leader>csp :OmniSharpStopServer<CR>

augroup END
" }}}


" === autozimu/LanguageClient-neovim === {{{
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
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" }}}
