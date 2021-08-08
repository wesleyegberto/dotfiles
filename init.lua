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

-- APIs for Lua (used by many plugins)
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-lua/popup.nvim'}

-- tmux integration and navigate between open pages with C-h C-j C-k C-k
paq {'benmills/vimux'}
paq {'christoomey/vim-tmux-navigator'}

-- display which keybindings is available
paq {'folke/which-key.nvim'}

-- show git stuff and info at line
paq {'tpope/vim-fugitive'}
paq {'airblade/vim-gitgutter'}

-- better syntax highlighter
paq {'nvim-treesitter/nvim-treesitter'}
-- plugin to facilitate the configuration for LSP
paq {'neovim/nvim-lspconfig'}

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
paq {'nvim-telescope/telescope.nvim'}
paq {'nvim-telescope/telescope-frecency.nvim'}

paq {'voldikss/vim-floaterm'}

paq {'mhinz/vim-startify'}

-- lsp
-- paq {'mfussenegger/nvim-jdtls'} -- java
paq {'OmniSharp/omnisharp-vim'} -- csharp

paq {'neovim/nvim-lspconfig'}
paq {'kabouzeid/nvim-lspinstall'}
paq {'nvim-lua/completion-nvim'}
paq {'ThePrimeagen/refactoring.nvim'}

paq {'glepnir/galaxyline.nvim'}

-- colorscheme
paq {'morhetz/gruvbox'}
paq {'ryanoasis/vim-devicons'}

paq {'kyazdani42/nvim-web-devicons'}
paq {'kyazdani42/nvim-tree.lua'}

paq {'rmagatti/auto-session'}
paq {'rmagatti/session-lens'}


-- #########################################################
-- # General settings
-- #########################################################

require('options')
require('keybindings')


-- #########################################################
-- # Plugins configuration
-- #########################################################

require('plugins/nvim-tree')
require('plugins/floaterm')
require('plugins/startify')
require('plugins/sessions')
require('plugins/telescope')
require('plugins/lsp')
require('plugins/refactoring')
require('plugins/galaxyline')
require('plugins/whichkey')


-- #########################################################
-- # Custom configuration
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

