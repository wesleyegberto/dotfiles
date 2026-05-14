-- #########################################################################
-- # ____    __    ____  _______     _______. __       ___________    ____ #
-- # \   \  /  \  /   / |   ____|   /       ||  |     |   ____\   \  /   / #
-- #  \   \/    \/   /  |  |__     |   (----`|  |     |  |__   \   \/   /  #
-- #   \            /   |   __|     \   \    |  |     |   __|   \_    _/   #
-- #    \    /\    /    |  |____.----)   |   |  `----.|  |____    |  |     #
-- #     \__/  \__/     |_______|_______/    |_______||_______|   |__|     #
-- # VIM Setup in Lua                                                      #
-- #########################################################################

-- disable netrw (must be before nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- General settings
require('config/options')
require('config/keybindings')

-- Load plugins (specs in lua/plugins/*.lua)
require('lazy').setup('plugins', {
  defaults = { lazy = false },
  install = { colorscheme = { 'tokyonight', 'gruvbox' } },
  checker = { enabled = false },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip', 'matchit', 'matchparen', 'netrwPlugin',
        'tarPlugin', 'tohtml', 'tutor', 'zipPlugin',
      },
    },
  },
})

-- Colorscheme (after plugins are loaded)
require('config/colorscheme')

