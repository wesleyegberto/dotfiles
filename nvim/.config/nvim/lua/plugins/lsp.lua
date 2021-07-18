--- Neovim LSP
local map = vim.api.nvim_set_keymap

local lspconfig = require'lspconfig'
local lspfuzzy = require'lspfuzzy'

require'lspinstall'.setup()

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  opts = { noremap = true }
  silentOpts = { noremap = true, silent=true }

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
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Enable the following language servers
local servers = { 'typescript', 'java' }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
