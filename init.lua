-- #########################################################################
-- # ____    __    ____  _______     _______. __       ___________    ____ #
-- # \   \  /  \  /   / |   ____|   /       ||  |     |   ____\   \  /   / #
-- #  \   \/    \/   /  |  |__     |   (----`|  |     |  |__   \   \/   /  #
-- #   \            /   |   __|     \   \    |  |     |   __|   \_    _/   #
-- #    \    /\    /    |  |____.----)   |   |  `----.|  |____    |  |     #
-- #     \__/  \__/     |_______|_______/    |_______||_______|   |__|     #
-- # VIM Setup in Lua                                                      #
-- #########################################################################

-- #########################################################
-- # Plugin installations
-- # `vim +PaqInstall +PaqUpdate +PaqClean +qall`
-- #########################################################

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('plugins')

-- General settings
require('config/options')
require('config/keybindings')
require('config/colorscheme')

-- Plugins configuration
require('plug-config/others-setup')
require('plug-config/nvim-tree')
require('plug-config/floaterm')
require('plug-config/telescope')
require('plug-config/galaxyline')
require('plug-config/lsp')
require('plug-config/completion')
require('plug-config/treesitter')
require('plug-config/refactoring')
require('plug-config/zettelkasten')
require('plug-config/sessions')
require('plug-config/dashboard')
require('plug-config/whichkey')

