--- Neovim LSP
local map = vim.api.nvim_set_keymap

local lsp = require 'lspconfig'
local lspfuzzy = require 'lspfuzzy'

opts = { noremap = true }
silentOpts = { noremap = true, silent=true }

-- root_dir is where the LSP server will start: here at the project root otherwise in current folder
-- lsp.pyls.setup {root_dir = lsp.util.root_pattern('.git', fn.getcwd())}

-- Make the LSP client use FZF instead of the quickfix list
lspfuzzy.setup {}

map('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
map('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

map('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gH', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
map('n', '<leader>ck', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

map('n', '<leader>cal', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<leader>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
map('n', '<leader>crn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

map('n', '<leader>cd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)

