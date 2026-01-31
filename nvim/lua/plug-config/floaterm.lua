-- === fvoldikss/vim-floatermloatterm ===

vim.api.nvim_set_keymap('i', '<F1>', '<cmd>FloatermToggle<CR>', { noremap = true })
vim.g.floaterm_keymap_toggle = '<F1>'
vim.g.floaterm_keymap_prev = '<F2>'
vim.g.floaterm_keymap_next = '<F3>'
vim.g.floaterm_keymap_new = '<F4>'

vim.g.floaterm_gitcommit = 'floaterm'
vim.g.floaterm_autoinsert = 1
vim.g.floaterm_position = 'center'
vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.8
vim.g.floaterm_wintitle = 0
vim.g.floaterm_wintype = 'floating'
vim.g.floaterm_autoclose = 1


-- set floaterm window's background to black
vim.cmd('hi Floaterm guibg=black')

-- set floating window border line color to cyan, and background to orange
vim.cmd('hi FloatermBorder guibg=none guifg=cyan')
