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
local u = require('utils')

-- #########################################################
-- # Plugin installations
-- # `vim +PaqInstall +PaqUpdate +PaqClean`
-- #########################################################

require('plugins')


-- #########################################################
-- # General settings
-- #########################################################

require('options')
require('keybindings')


-- #########################################################
-- # Plugins configuration
-- #########################################################

-- others setup
require('plug-config/others-setup')

require('plug-config/nvim-tree')
require('plug-config/floaterm')
require('plug-config/telescope')
require('plug-config/lsp')
require('plug-config/refactoring')
require('plug-config/compe')
require('plug-config/galaxyline')
require('plug-config/whichkey')
require('plug-config/sessions')
require('plug-config/dashboard')
require('plug-config/zettelkasten')


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

