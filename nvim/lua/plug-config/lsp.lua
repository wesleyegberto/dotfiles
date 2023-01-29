--- Neovm LSP
local map = vim.api.nvim_set_keymap

local lspconfig = require'lspconfig'

require('mason').setup()
local mason_lsconfig = require'mason-lspconfig'
mason_lsconfig.setup()

opts = { noremap = true }
map('n', '<leader>ls', ':LspStart<CR>', opts)
map('n', '<leader>lS', ':LspStop<CR>', opts)
map('n', '<leader>ll', ':LspLog<CR>', opts)
map('n', '<leader>li', ':LspInfo<CR>', opts)
map('n', '<leader>lp', ':Mason<CR>', opts)


local function init_lspkind()
  require('lspkind').init({
      mode = 'symbol_text',
      preset = 'default',
      symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
      },
  })
end

local function setup_keymappings()
  silentOpts = { noremap = true, silent=true }

  vim.cmd [[
    augroup lsp_document_highlight
        autocmd! * <buffer>
        " autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})
        autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
  ]]

  map('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>', opts)

  map('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  map('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map('n', 'gD', "<cmd>lua require'lsp.peek'.Peek('definition')<CR>", opts)
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map('n', 'gI', "<cmd>lua require'lsp.peek'.Peek('implementation')<CR>", opts)
  map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  map('n', 'gr', ':Telescope lsp_references<CR>', opts)


  map('n', '<Leader>cft', ':Telescope lsp_dynamic_workspace_symbols<CR>', opts)
  map('n', '<Leader>cfm', ':Telescope lsp_document_symbols<CR>', opts)
  map('n', '<Leader>cfi', ':Telescope lsp_incoming_calls<CR>', opts)
  map('n', '<Leader>cfo', ':Telescope lsp_outgoing_calls<CR>', opts)

  map('n', '<leader>crn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

  map('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map('n', '<leader>ch', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  map('i', '<C-\\>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  map('n', '<leader>cal', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  map('v', '<leader>cas', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)

  map('n', '<leader>csf', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
  map('v', '<leader>csf', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)

  map('n', '<leader>cdl', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  map('n', '<leader>cdp', ':Telescope lsp_workspace_diagnostics<CR>', opts)
  map('n', '<leader>cdt', ':TroubleToggle<CR>', opts)

  -- vim-test
  map('n', '<leader>rta', ':TestSuite<CR>', opts)
  map('n', '<leader>rtf', ':TestFile<CR>', opts)
  map('n', '<leader>rtl', ':TestLast<CR>', opts)
  map('n', 'glt', ':TestVisit<CR>zz', opts) -- go to last test run
end


local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Make the LSP client use FZF instead of the quickfix list
  -- require'lspfuzzy'.setup{}

  init_lspkind()

  setup_keymappings()

  require('trouble').setup()
end

local default_opts = {
  on_attach = on_attach,
  capabilities = capabilities,
}

local servers = { 'tsserver', 'jdtls', 'pyright', 'omnisharp', 'angularls', 'html' }

mason_lsconfig.setup {
  ensure_installed = servers
}

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local pid = vim.fn.getpid()
lspconfig['omnisharp'].setup{
  on_attach = on_attach,
  flags = capabilities,
  cmd = { '/Users/wesley/.cache/omnisharp-vim/omnisharp-roslyn/run', '--languageserver', '--hostPID', tostring(pid) }
}

