-- #########################################################################
-- # ____    __    ____  _______     _______. __       ___________    ____ #
-- # \   \  /  \  /   / |   ____|   /       ||  |     |   ____\   \  /   / #
-- #  \   \/    \/   /  |  |__     |   (----`|  |     |  |__   \   \/   /  #
-- #   \            /   |   __|     \   \    |  |     |   __|   \_    _/   #
-- #    \    /\    /    |  |____.----)   |   |  `----.|  |____    |  |     #
-- #     \__/  \__/     |_______|_______/    |_______||_______|   |__|     #
-- # VIM Setup in Lua                                                      #
-- #########################################################################
-- cp ~/init.lua ~/.config/nvim/init.lua

local cmd = vim.cmd
local fn = vim.fn
local u = require('utils')

-- #########################################################
-- # Plugin installations
-- # `vim +PaqInstall +PaqUpdate +PaqClean`
-- #########################################################

cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq {'savq/paq-nvim', opt = true}

-- tmux integration and navigate between open pages with C-h C-j C-k C-k
paq {'benmills/vimux'}
paq {'christoomey/vim-tmux-navigator'}

-- display which keybindings is available
paq {'folke/which-key.nvim'}

-- show git stuff and info at line
paq {'tpope/vim-fugitive'}
paq {'airblade/vim-gitgutter'}

paq {'nvim-treesitter/nvim-treesitter'}        -- better syntax highlighter
paq {'neovim/nvim-lspconfig'}                  -- plugin to facilitate the configuration for LSP

-- plugin to facilitate navigation
paq {'tpope/vim-unimpaired'}
paq {'easymotion/vim-easymotion'}

-- mappings to easily delete, change and add such surroundings in {}, (), [], "", ''
paq {'tpope/vim-surround'}

-- autoclose and actions to insert spaces or new line between {}, (), []
paq {'jiangmiao/auto-pairs'}

-- highlight trailing whitespaces
paq {'ntpeters/vim-better-whitespace'}
paq {'tpope/vim-commentary'}

-- sublime-like multiple cursor editor
paq {'terryma/vim-multiple-cursors'}

paq {'junegunn/fzf', run = fn['fzf#install']}
paq {'junegunn/fzf.vim'}
paq {'ojroques/nvim-lspfuzzy'}

-- alternative to FZF
paq {'nvim-lua/popup.nvim'}
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-telescope/telescope.nvim'}

paq {'voldikss/vim-floaterm'}

paq {'mhinz/vim-startify'}

-- lsp
-- paq {'mfussenegger/nvim-jdtls'} -- java
paq {'OmniSharp/omnisharp-vim'} -- csharp

paq {'neovim/nvim-lspconfig'}
paq {'kabouzeid/nvim-lspinstall'}

-- colorscheme
paq {'morhetz/gruvbox'}
paq {'ryanoasis/vim-devicons'}


-- #########################################################
-- # General settings
-- #########################################################

require('options')
require('keybindings')


-- #########################################################
-- # Plugins configuration
-- #########################################################

require('plugins/floaterm')
require('plugins/whichkey')
require('plugins/startify')
require('plugins/lsp')


-- #########################################################
-- # Plugins configuration
-- #########################################################

-- builtin highlight yanked content
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- === translated from jeffkreeftmeijer/vim-numbertoggle === {{{
-- hybrid mode (normal mode: relative, insert mode: absolute)
u.create_augroup('numbertoggle', {
    { 'BufEnter,FocusGained,InsertLeave,WinEnter', '*', 'if &nu | set rnu | endif' },
    { 'BufLeave,FocusLost,InsertEnter,WinLeave', '*', 'if &nu | set nornu | endif' }
})
-- }}}

-- === ntpeters/vim-better-whitespace === {{{
vim.g.strip_whitespace_on_save = 1
-- }}}

