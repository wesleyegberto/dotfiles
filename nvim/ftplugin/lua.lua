local map = vim.api.nvim_set_keymap

vim.cmd [[
  setlocal expandtab
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal softtabstop=2
]]


local options = { noremap = true, silent = true }
map('n', '<Space><Space>x', '<cmd>source %<CR>', options)
map('n', '<Space>x', ':.lua<CR>', options)
map('v', '<Space>x', ':lua<CR>', options)

