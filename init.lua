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

require('options')

local u = require('utils')






-- #########################################################
-- # Plugins configuration
-- #########################################################

-- === translated from jeffkreeftmeijer/vim-numbertoggle === {{{
-- hybrid mode (normal mode: relative, insert mode: absolute)
u.create_augroup('numbertoggle', {
    { 'BufEnter,FocusGained,InsertLeave,WinEnter', '*', 'if &nu | set rnu   | endif' },
    { 'BufLeave,FocusLost,InsertEnter,WinLeave', '*', 'if &nu | set nornu | endif' }
})
-- }}}

