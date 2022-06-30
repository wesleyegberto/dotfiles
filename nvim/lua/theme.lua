-- #########################################################
-- # Appearance
-- #########################################################
vim.cmd('syntax on')

vim.o.background = 'dark'

vim.g.gruvbox_italic = 1
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = '0'

vim.cmd [[
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
]]

require('onedark').setup { style = 'deep' }

-- require("gruvbox").setup({})


vim.cmd('colorscheme onedark')
-- vim.cmd('colorscheme gruvbox')

--- popup colors
vim.cmd [[
hi Pmenu      ctermbg=Darkgray  guibg=Drakgray  ctermfg=White guifg=White
hi PmenuSel   ctermbg=White guibg=White ctermfg=Black guifg=Black
hi PmenuThumb ctermbg=Black guibg=Black ctermfg=White guifg=White
]]
