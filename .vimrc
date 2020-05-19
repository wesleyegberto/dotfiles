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

" === liuchengxu/vim-which-key' === {{{
    let g:which_key_map = {}

    let g:which_key_map.s = {
        \ 'name'  : '+syntastic',
        \ 't'     : [':SyntasticToggleMode',  'Toggle mode between active/passive checker'],
        \ 'b'     : [':SyntasticCheck',       'run checker'],
        \ 'o'     : [':lopen',                'show error messages'],
        \ 'c'     : [':lclose',               'hide error messages'],
        \ 'n'     : [':lnext',                'go to next error'],
        \ 'p'     : [':lprevious',            'go to previous error'],
        \ }

    let g:which_key_map.w = {
        \ 'name' : '+windows'      ,
        \ 'w'    : ['<C-w>w'       , 'other-window']          ,
        \ 'q'    : ['<C-w>q'       , 'quit-window']           ,
        \ 'd'    : ['<C-w>q'       , 'quit-window']           ,
        \ '-'    : ['<C-w>s'       , 'split-window-below']    ,
        \ '|'    : ['<C-w>v'       , 'split-window-right']    ,
        \ '2'    : ['<C-w>v'       , 'layout-double-columns'] ,
        \ 'h'    : ['<C-w>h'       , 'window-left']           ,
        \ 'j'    : ['<C-w>j'       , 'window-below']          ,
        \ 'l'    : ['<C-w>l'       , 'window-right']          ,
        \ 'k'    : ['<C-w>k'       , 'window-up']             ,
        \ 'H'    : ['<C-w>5<'      , 'expand-window-left']    ,
        \ 'J'    : ['resize -5'    , 'expand-window-below']   ,
        \ 'L'    : ['<C-w>5>'      , 'expand-window-right']   ,
        \ 'K'    : ['resize +5'    , 'expand-window-up']      ,
        \ '='    : ['<C-w>='       , 'balance-window']        ,
        \ 's'    : ['<C-w>s'       , 'split-window-below']    ,
        \ 'v'    : ['<C-w>v'       , 'split-window-aside']    ,
        \ 'x'    : ['<C-w>x'       , 'flip-windows']          ,
        \ 'th'   : ['<C-w>t<C-w>H' , 'flip-horiz-to-vert']    ,
        \ 'tk'   : ['<C-w>t<C-w>K' , 'flip-vert-to-horiz']    ,
        \ '?'    : ['Windows'      , 'fzf-window']            ,
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

" required by vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

" #########################################################
" # Plugin installations
" #########################################################

" Insert all Plugins inside this block
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'

    " tmux integration and navigate between open pages with C-h C-j C-k C-k
    Plugin 'benmills/vimux'
    Plugin 'christoomey/vim-tmux-navigator'

    " display which keybindings is available
    Plugin 'liuchengxu/vim-which-key'

    " nerdtree and tabs
    Plugin 'scrooloose/nerdtree'
    Plugin 'jistr/vim-nerdtree-tabs'
    Plugin 'Xuyuanp/nerdtree-git-plugin'

    " fuzzy find (like Sublime)
    Plugin 'junegunn/fzf', { 'do': './install --bin' }
    Plugin 'junegunn/fzf.vim'

    Plugin 'jeetsukumaran/vim-buffergator'

    " Hybrid between number (when editing) and relative number (when navigating)
    Plugin 'jeffkreeftmeijer/vim-numbertoggle'

    Plugin 'machakann/vim-highlightedyank'

    " Show git stuff and info at line
    Plugin 'tpope/vim-fugitive'
    Plugin 'airblade/vim-gitgutter'

    " nicer status bar
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'

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

    " code checker for C#
    Plugin 'OmniSharp/omnisharp-vim'

    " snippets (plugin and collection of snippets)
    Plugin 'honza/vim-snippets'
    Plugin 'SirVer/ultisnips'

    " Startify: Fancy startup screen for vim
    Plugin 'mhinz/vim-startify'

    " colorscheme
    " Plugin 'dracula/vim', { 'name': 'dracula' }
    " Plugin 'fmoralesc/molokayo'
    " Plugin 'joshdick/onedark.vim'
    " Plugin 'kyoz/purify', { 'rtp': 'vim' }
    " Plugin 'kaicataldo/material.vim'
    " Plugin 'KeitaNakamura/neodark.vim'
    Plugin 'morhetz/gruvbox'

    " devicons (should be loaded after the current plugins)
    Plugin 'ryanoasis/vim-devicons'
    Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
call vundle#end()



" #########################################################
" # Appearance
" #########################################################

syntax on

set termguicolors

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
" let g:neodark#solid_vertsplit = 1
" let g:neodark#use_256color = 1
" colorscheme neodark

let g:gruvbox_italic=1
colorscheme gruvbox

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

nnoremap <Leader>wth <C-w>t<C-w>H   " flip vertical split to horizontal
nnoremap <Leader>wtk <C-t>t<C-w>K   " flip horizontal split to vertical

nnoremap <C-w>th <C-w>t<C-w>H       " flip vertical split to horizontal
nnoremap <C-w>tk <C-t>t<C-w>K       " flip horizontal split to vertical

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
set listchars=tab:→\ ,trail:⋅,extends:❯,precedes:❮
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


set updatetime=300                                  " You will have bad experience for diagnostic messages when it's default 4000
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

" nmap <silent> <Leader>t :NERDTreeToggle<CR>                           " toggle NERDTree Tabs
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
function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction
let g:fzf_buffers_jump = 1                                            " [Buffers] Jump to the existing window if possible
nnoremap <silent> <C-p> :call FZFOpen(':Files')<CR>

" autocmd FileType nerdtree let t:nerdtree_winnr = bufwinnr('%')
" autocmd BufWinEnter * call PreventBuffersInNERDTree()
" function! PreventBuffersInNERDTree()
"   if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree'
"     \ && exists('t:nerdtree_winnr') && bufwinnr('%') == t:nerdtree_winnr
"     \ && &buftype == '' && !exists('g:launching_fzf')
"     let bufnum = bufnr('%')
"     close
"     exe 'b ' . bufnum
"     NERDTree
"   endif
"   if exists('g:launching_fzf') | unlet g:launching_fzf | endif
" endfunction

" nmap <silent> <C-p> :FZF<CR>
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
    \ { 'v': '~/.config/nvim/init.vim' },
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

" color for gruvbox
hi CocErrorHighlight    ctermfg=Red   guifg=#ff3333
hi CocErrorLine         ctermbg=DarkGray  guibg=#200000
" color for others
" hi CocErrorHighlight    ctermfg=Red   guifg=#000000
" hi CocErrorLine         ctermbg=DarkGray  guibg=#1C2117

hi CocErrorSign         ctermfg=Red   guifg=#ff1100
hi CocErrorVirtualText  ctermfg=Red   guifg=#ff1100
hi CocErrorFloat        ctermfg=Black guifg=#000000

hi CocWarningHighlight  ctermfg=Yellow guifg=#ff922b
hi CocWarningFloat      ctermfg=Yellow guifg=#ff922b
" hi CocWarningLine       ctermfg=Yellow guifg=#ff922b

augroup coc_commands
autocmd!

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
    autocmd FileType java nmap <silent> gd <Plug>(coc-definition)
    autocmd FileType java nmap <silent> gi <Plug>(coc-implementation)
    autocmd FileType java nmap <silent> gy <Plug>(coc-type-definition)
    autocmd FileType java nmap <silent> gr <Plug>(coc-references)

    " use `gh` to show documentation in preview window
    autocmd FileType java nnoremap <silent> gh :call <SID>show_documentation()<CR>
    autocmd FileType java nnoremap <silent> <Leader>cd :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " remap for rename current word
    autocmd FileType java nmap <Leader>crn <Plug>(coc-rename)

    " Remap for do codeAction of selected region, ex: `<Leader>camap` for current paragraph
    function! s:cocActionsOpenFromSelected(type) abort
      execute 'CocCommand actions.open ' . a:type
    endfunction

    " Remap for do codeAction of current line
    autocmd FileType java nmap <Leader>cal :CocCommand actions.open<CR>
    " code action for the selected content
    autocmd FileType java xnoremap <Leader>cas :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
    " code action with motion
    autocmd FileType java nnoremap <Leader>cam :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

    " Fix autofix problem of current line
    autocmd FileType java nmap <Leader>qf  <Plug>(coc-fix-current)
    autocmd FileType java nmap <Leader>cqf  <Plug>(coc-fix-current)

    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')
    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    " use `:OR` for organize import of current buffer
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Remap for format selected region
    autocmd FileType java nmap <Leader>cf :call CocAction('format')<CR>
    autocmd FileType java xmap <Leader>csf <Plug>(coc-format-selected)
    autocmd FileType java nmap <Leader>csf <Plug>(coc-format-selected)

    " Find symbol of current document
    autocmd FileType java nnoremap <Leader>cfm  :<C-u>CocList outline<cr>

    " Show all diagnostics
    autocmd FileType java nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    autocmd FileType java nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    autocmd FileType java nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Search workspace symbols
    autocmd FileType java nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

    " # coc-snippets
    " :CocList snippets
    " :CocCommand snippets.editSnippets
    " :CocCommand snippets.openSnippetFiles

    " Use <C-l> for trigger snippet expand.
    imap <C-l> <Plug>(coc-snippets-expand)

    " Use <C-j> for select text for visual placeholder of snippet.
    vmap <C-j> <Plug>(coc-snippets-select)

    " Navigation between snippet placeholder
    let g:coc_snippet_next = '<c-n>'
    let g:coc_snippet_prev = '<c-p>'

    inoremap <silent><expr> <TAB>
          \ pumvisible() ? coc#_select_confirm() :
          \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
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
 let g:syntastic_loc_list_height = 5              " height
let g:syntastic_auto_loc_list = 1                 " open errors when any
" check on open may slow down
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = "\u2716"
let g:syntastic_warning_symbol = "\u26A0"

let g:syntastic_quiet_messages = {
  \ "!level":  "errors",
  \ "type":    "style",
  \ "regex":   '\m.*encoding US-ASCII$',
  \ "file:p":  ['\m^/usr/include/', '\m\c\.h$'] }

let g:syntastic_java_checkers = ['checkstyle', 'javac']
let g:syntastic_cs_checkers = ['code_checker']
" }}}


" === OmniSharp/omnisharp-vim === {{{
"let g:sharpenup_map_prefix = '\c'
" let g:sharpenup_create_mappings = 0

let g:OmniSharp_server_stdio = 1
let g:OmniSharp_selector_ui = 'fzf'

let g:OmniSharp_highlight_types = 3

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

    autocmd FileType cs nnoremap <buffer> gh :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>cod :OmniSharpDocumentation<CR>

    autocmd FileType cs inoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>cqf :OmniSharpFixUsings<CR>

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
