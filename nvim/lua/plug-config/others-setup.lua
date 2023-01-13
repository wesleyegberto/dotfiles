local ui = vim.api.nvim_list_uis()[1]
local map = vim.api.nvim_set_keymap

require('bqf').setup()

require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }

require('Comment').setup()

require('nvim-autopairs').setup()
require('nvim-surround').setup()

require('jabs').setup {
  position = 'center', -- center, corner
  width = 150,
  height = 10,
  border = 'rounded', -- none, single, double, rounded, solid, shadow, (or an array or chars)

  -- Options for preview window
  preview_position = 'left', -- top, bottom, left, right
  preview = {
    width = 40,
    height = 30,
    border = 'double', -- none, single, double, rounded, solid, shadow, (or an array or chars)
  },

  -- the options below are ignored when position = 'center'
  col = ui.width,  -- Window appears on the right
  row = ui.height/2, -- Window appears in the vertical middle
}

-- === nvim-pack/nvim-spectre ===
require('spectre').setup()

local opts = { noremap = true, silent=true }

map('n', '<leader>kf', 'lua require("spectre").open()<CR>', opts)
-- search current word
map('n', '<leader>kw', 'lua require("spectre").open_visual({select_word=true})<CR>', opts)
map('v', '<leader>ks', 'lua require("spectre").open_visual()<CR>', opts)
-- search in current file
map('n', '<leader>kb', 'lua require("spectre").open_file_search()<CR>', opts)
-- === end ===


