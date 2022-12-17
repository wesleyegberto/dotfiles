" Not used with `init.lua`, it is kept here to use with other tools

" #########################################################
" # Appearance
" #########################################################
syntax on

set termguicolors

" let g:material_theme_style = 'palenight'
" let g:material_terminal_italics = 1
" colorscheme material

" let g:dracula_colorterm = 0
" let g:dracula_italic = 0
" colorscheme dracula
" color dracula

" colorscheme onedark
" let g:neodark#solid_vertsplit = 1
" let g:neodark#use_256color = 1
" colorscheme neodark

let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

set background=dark
colorscheme gruvbox


" popup colors
hi Pmenu      ctermbg=Darkgray  guibg=Drakgray  ctermfg=White guifg=White
hi PmenuSel   ctermbg=White guibg=White ctermfg=Black guifg=Black
hi PmenuThumb ctermbg=Black guibg=Black ctermfg=White guifg=White


" #########################################################
" # General settings
" #########################################################

set t_Co=256                                                 " explicitly tell vim that the terminal supports 256 colors
set ttyfast                                                  " faster redrawing

set nocompatible                                             " no compatibility with vi
set encoding=utf-8

set hidden                                                   " to allow switch between buffers without save

set nobackup                                                 " some servers have issues with backup files, see #649
set nowritebackup

set cmdheight=1                                              " better display for messages

" if has('unnamedplus')
"   set clipboard=unnamedplus,unnamed
" else
"   set clipboard+=unnamed
" endif
set clipboard+=unnamed

set mouse=a                                                  " enable mouse if possible

set ls=2                                                     " always show status bar
set number relativenumber                                    " show relative number of lines to the current line
set cursorline                                               " display a marker on current line
set noshowmode                                               " airline will do the job
set showcmd                                                  " display incomplete commands
set showmatch                                                " show matching brackets/parentthesis

"" Whitespace and indentation
set nowrap                                                   " don't wrap lines
set expandtab!                                               " by default not expand tab
set tabstop=4                                                " a tab is two spaces (or set this to 4)
set shiftwidth=4
set softtabstop=4
set lazyredraw                                               " don't redraw while executing macros
set smartindent
set colorcolumn=20

set backspace=indent,eol,start                               " allow backspace over everything in isert mode

" Searching
set hlsearch                                                 " highlight matches
set incsearch                                                " incremental searching
set ignorecase                                               " searches are insensitive
set smartcase                                                " unless they contain at least one capital letter

" Code folding settings (use `zc`, `zo`, `zz`)
set nofoldenable                                             " don't fold by default
set foldmethod=marker
set foldmarker={,}
set foldlevel=1
set foldlevelstart=99
set foldnestmax=10                                           " deepest fold is 10 levels

" Toggle invisible characters
set list
set listchars=tab:→\ ,trail:⋅,extends:❯,precedes:❮,extends:#,nbsp:.
set showbreak=↪

" Scroll
set scrolloff=3

" Autocomplete menu
set completeopt=menuone,longest,preview                      " simple autocomplete for anything
set completeopt=menuone,noselect                             " simple autocomplete for anything
set previewheight=5                                          " preview window height for viewing documentation
set wildmenu
set wildmode=list:longest,full                               " autocomplete for paths and files
" set wildoptions=pum,tagfile                                " display popup
" set pumblend=0                                             " transparence
" ignore these extensions on autocomplete
set wildignore+=*swp,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip,.git,.DS_Store
set wildignore+=*/tmp/*,*.o,*.obj,*.so

" Highlight the content to replace before doing it without spliting
" set inccommand=nosplit

" Note that neovim does not support `popuphidden` or `popup` yet:
" https://github.com/neovim/neovim/issues/10996
if has('patch-8.1.1880')
  set completeopt=longest,menuone,popuphidden
  " Highlight the completion documentation popup background/foreground the same as
  " the completion menu itself, for better readability with highlighted
  " documentation.
  set completepopup=highlight:Pmenu,border:off
endif

set updatetime=1000                                          " You will have bad experience for diagnostic messages when it's default 4000
set shortmess+=c                                             " don't give |ins-completion-menu| messages
set signcolumn=yes                                           " always show signcolumns


if $TERM_PROGRAM =~# 'iTerm'
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" inside tmux
if exists('$TMUX') && $TERM != 'xterm-kitty'
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif

" inside neovim
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=2
endif

filetype plugin indent on                                    " load identation by file type
autocmd BufNewFile,BufRead *.cs set ft=csharp
autocmd BufNewFile,BufRead *.cshtml set ft=html

