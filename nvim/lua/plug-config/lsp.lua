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

  vim.cmd [[
    autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})
  ]]

  -- Use <Tab> and <S-Tab> to navigate through popup menu
  vim.cmd [[
    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    let g:completion_enable_auto_popup = 0
    imap <C-Space> <Plug>(completion_smart_tab)
    imap <tab> <Plug>(completion_smart_tab)
    imap <s-tab> <Plug>(completion_smart_s_tab)

    " use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " close preview window when completion is done.
    autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
  ]]

  -- map('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>', opts)

  map('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  map('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

  map('n', '<Leader>cfi', '<cmd>lua vim.lsp.buf.ingoing_calls()<CR>', opts)
  map('n', '<Leader>cfo', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts)

  map('n', '<Leader>cft', ':Telescope lsp_dynamic_workspace_symbols<CR>', opts)
  map('n', '<Leader>cfm', ':Telescope lsp_document_symbols<CR>', opts)
  map('n', '<leader>crn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

  map('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map('n', '<leader>ch', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  map('i', '<C-\\>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  map('n', '<leader>cal', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  map('v', '<leader>cas', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)

  map('n', '<leader>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  map('v', '<leader>cf', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)

  map('n', '<leader>cd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  map('n', '<leader>cD', ':Telescope lsp_workspace_diagnostics<CR>', opts)
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
