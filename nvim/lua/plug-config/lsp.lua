--- Neovm LSP
local map = vim.api.nvim_set_keymap

local lspconfig = require'lspconfig'

local home = os.getenv('HOME')

require('mason').setup({
  ui = {
    border = 'rounded',
    icons = {
      package_installed = "✅",
      package_pending = "⏳",
      package_uninstalled = "☑️"
    }
  }
})

local mason_lsconfig = require'mason-lspconfig'
mason_lsconfig.setup()

local function setup_keymaps()
  opts = { noremap = true }
  silentOpts = { noremap = true, silent=true }

  vim.cmd [[
    augroup lsp_document_highlight
        autocmd! * <buffer>
        " autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})
        autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
  ]]

  map('n', '<leader>ls', ':LspStart<CR>', opts)
  map('n', '<leader>lS', ':LspStop<CR>', opts)
  map('n', '<leader>ll', ':LspLog<CR>', opts)
  map('n', '<leader>li', ':LspInfo<CR>', opts)
  map('n', '<leader>lp', ':Mason<CR>', opts)

  map('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>', opts)

  map('n', '[g', ':LspUI diagnostic prev<CR>', opts)
  map('n', ']g', ':LspUI diagnostic next<CR>', opts)

  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map('n', 'gD', "<cmd>Glance definitions<CR>", opts)
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map('n', 'gI', "<cmd>Glance implementations<CR>", opts)
  map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  map('n', 'gT', '<cmd>Glance type_definitions<CR>', opts)
  map('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
  map('n', 'gR', '<cmd>Glance references<CR>', opts)


  map('n', '<Leader>cft', ':Telescope lsp_dynamic_workspace_symbols<CR>', opts)
  map('n', '<Leader>cfm', ':Telescope lsp_document_symbols<CR>', opts)
  map('n', '<Leader>cfi', ':Telescope lsp_incoming_calls<CR>', opts)
  map('n', '<Leader>cfo', ':Telescope lsp_outgoing_calls<CR>', opts)

  map('n', '<leader>crn', ':LspUI rename<CR>', opts)
  map('n', '<F2>', ':LspUI rename<CR>', opts)

  map('n', 'gh', ':LspUI hover<CR>', opts)
  map('n', '<leader>ch', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  map('n', '<C-\\>', '<cmd>lua require("lsp_signature").toggle_float_win()<CR>', opts)
  map('i', '<C-\\>', '<cmd>lua require("lsp_signature").toggle_float_win()<CR>', opts)

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

local function init_lsp_tools()
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

  -- window preview enhancements
  local glance = require('glance')
  glance.setup({
    -- your configuration
    border = {
      enable = true
    },
    mappings = {
      list = {
        ['l'] = glance.actions.jump
      }
    }
  })

  require("LspUI").setup()
  require 'lsp_signature'.setup({
    bind = true,
    handler_opts = {
      border = 'rounded'
    },
    max_height = 15,
    max_width = 120,
    timer_interval = 100
  })

  require('trouble').setup()

end


local on_attach = function(_, bufnr)
  require'lsp-lens'.setup({})

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  require('lsp_signature').on_attach()
end

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = { 'pyright', 'omnisharp', 'tsserver', 'angularls', 'html', 'lua' }

mason_lsconfig.setup {
  ensure_installed = servers
}

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

for _, lsp in ipairs(servers) do
  if lsp ~= ('omnisharp' and 'tsserver') then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end

require("typescript").setup({
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  server = {
    on_attach = on_attach
  },
})

local pid = vim.fn.getpid()
lspconfig['omnisharp'].setup {
  cmd = { home .. '/.cache/omnisharp-vim/omnisharp-roslyn/run', '--languageserver', '--hostPID', tostring(pid) },
  on_attach = on_attach,
  flags = capabilities,
  handlers = {
    ["textDocument/definition"] = require('omnisharp_extended').handler,
  },
  enable_roslyn_analyzers = true,
  organize_imports_on_format = true,
  analyze_open_documents_only = true,
}

require("mason-nvim-dap").setup({
  ensure_installed = { "javadbg", "javatest" }
})

-- Make the LSP client use FZF instead of the quickfix list
-- require'lspfuzzy'.setup{}
init_lsp_tools()

setup_keymaps()

