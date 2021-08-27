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

" required by vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim


source $HOME/.config/nvim/options.vim
source $HOME/.config/nvim/keys/mappings.vim


" #########################################################
" # Languages configuration
" #########################################################

filetype plugin indent on                                    " load identation by file type


" #########################################################
" # Plugins configuration
" #########################################################

source $HOME/.config/nvim/plug-config/which-key.vim
source $HOME/.config/nvim/plug-config/startify.vim
source $HOME/.config/nvim/plug-config/statusbar.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
source $HOME/.config/nvim/plug-config/fzf.vim


" === jeffkreeftmeijer/vim-numbertoggle === {{{
" hybrid mode (normal mode: relative, insert mode: absolute)
:augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
:augroup END
" }}}


" ===  builtin highlight yanked content === {{{
:augroup textyankpost
  autocmd!
  autocmd au TextYankPost * lua vim.highlight.on_yank {on_visual = false}
:augroup END
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

source $HOME/.config/nvim/plug-config/omnisharp.vim
