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

    " fuzzy find (like Sublime)
    Plugin 'junegunn/fzf', { 'do': './install --bin' }
    Plugin 'junegunn/fzf.vim'

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
    Plugin 'tpope/vim-commentary'

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

    Plugin 'voldikss/vim-floaterm'

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
" # General settings
" #########################################################

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
nnoremap <Space><Space> :nohlsearch<CR> " unhighlight the search result

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

source $HOME/.config/nvim/keys/mappings.vim


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

source $HOME/.config/nvim/plug-config/which-key.vim
source $HOME/.config/nvim/plug-config/startify.vim
source $HOME/.config/nvim/plug-config/airline.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
source $HOME/.config/nvim/plug-config/fzf.vim


" === airblade/vim-gitgutter === {{{
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1
" }}}


" === jeffkreeftmeijer/vim-numbertoggle === {{{
" hybrid mode (normal mode: relative, insert mode: absolute)
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
" }}}


" === machakann/vim-highlightedyank === {{{
let g:highlightedyank_highlight_duration = 1000                       " Highlight the content copied
" }}}


" === jiangmiao/auto-pairs === {{{
" let g:AutoPairsMultilineClose = 0
" let g:AutoPairsMapSpace = 0                                         " disable extra space between {}, (), [] when pressing <space>
" }}}


" === ntpeters/vim-better-whitespace === {{{
let g:strip_whitespace_on_save = 1
" }}}


" === tpope/vim-commentary === {{{
nnoremap <Leader>C :Commentary<CR>
vnoremap <Leader>C :Commentary<CR>
" }}}


" === tpope/vim-unimpaired === {{{
nmap <M-Up> <Plug>unimpairedMoveUp
nmap <M-Down> <Plug>unimpairedMoveDown
" }}}


" === SirVer/ultisnips === {{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}


source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/syntastic.vim
source $HOME/.config/nvim/plug-config/omnisharp.vim
