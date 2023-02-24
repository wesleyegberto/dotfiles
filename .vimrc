" #########################################################################
" # ____    __    ____  _______     _______. __       ___________    ____ #
" # \   \  /  \  /   / |   ____|   /       ||  |     |   ____\   \  /   / #
" #  \   \/    \/   /  |  |__     |   (----`|  |     |  |__   \   \/   /  #
" #   \            /   |   __|     \   \    |  |     |   __|   \_    _/   #
" #    \    /\    /    |  |____.----)   |   |  `----.|  |____    |  |     #
" #     \__/  \__/     |_______|_______/    |_______||_______|   |__|     #
" # VIM Setup: used only in same cases (replaced by init.lua)             #
" #########################################################################

filetype off

source $HOME/.config/nvim/options.vim
source $HOME/.config/nvim/mappings.vim

" ===  builtin highlight yanked content === {{{
:augroup textyankpost
  autocmd!
  autocmd au TextYankPost * lua vim.highlight.on_yank {on_visual = false}
:augroup END
" }}}

source $HOME/.config/nvim/plug-config/omnisharp.vim
