--- Neovim LSP
local map = vim.api.nvim_set_keymap

local lspconfig = require'lspconfig'
local lspfuzzy = require'lspfuzzy'
local lspfidget = require"fidget"

local function init_lspkind()
  require('lspkind').init({
      -- defines how annotations are shown
      -- default: symbol
      -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
      mode = 'symbol_text',

      -- default symbol map
      -- can be either 'default' or
      -- 'codicons' for codicon preset (requires vscode-codicons font installed)
      -- default: 'default'
      preset = 'codicons',

      -- override preset symbols
      --
      -- default: {}
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
  opts = { noremap = true }
  silentOpts = { noremap = true, silent=true }

  vim.cmd [[
    augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})
        autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
  ]]

  map('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  map('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map('n', 'gD', "<cmd>lua require'lsp.peek'.Peek('definition')<CR>", opts)
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map('n', 'gI', "<cmd>lua require'lsp.peek'.Peek('implementation')<CR>", opts)
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

  map('n', '<leader>csf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  map('v', '<leader>csf', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)

  map('n', '<leader>cd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  map('n', '<leader>cD', ':Telescope lsp_workspace_diagnostics<CR>', opts)

  vim.cmd [[
    :Copilot enable
  ]]
  -- imap <silent><script><expr> <C-Tab> copilot#Accept("\<CR>")
  -- let g:copilot_no_tab_map = v:true
end

local function setup_snippet()
  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local check_back_space = function()
      local col = vim.fn.col('.') - 1
      return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
  end

  -- Use (s-)tab to:
  --- move to prev/next item in completion menuone
  --- jump to prev/next snippet's placeholder
  _G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-n>"
    elseif vim.fn['vsnip#available'](1) == 1 then
      return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
      return t "<Tab>"
    else
      return vim.fn['compe#complete']()
    end
  end
  _G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-p>"
    elseif vim.fn['vsnip#jumpable'](-1) == 1 then
      return t "<Plug>(vsnip-jump-prev)"
    else
      -- If <S-Tab> is not working in your terminal, change it to <C-h>
      return t "<S-Tab>"
    end
  end

  vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

  vim.cmd [[
    inoremap <silent><expr> <C-Space> compe#complete()
    inoremap <silent><expr> <CR>      compe#confirm('<CR>')
    inoremap <silent><expr> <C-e>     compe#close('<C-e>')
    inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
    inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
  ]]

  -- map('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>', opts)
end

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Make the LSP client use FZF instead of the quickfix list
  lspfuzzy.setup{}
  lspfidget.setup{}

  init_lspkind()

  setup_keymappings()

  setup_snippet()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local default_opts = {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('nvim-lsp-installer').setup {
  ensure_installed = { 'tsserver', 'jdtls', 'pyright', 'omnisharp', 'angularls', 'html' }
}

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = capabilities,
}

require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = capabilities,
}

require('lspconfig')['jdtls'].setup{
    on_attach = on_attach,
    flags = capabilities,
}

require('lspconfig')['angularls'].setup{
    on_attach = on_attach,
    flags = capabilities,
}

require('lspconfig')['html'].setup{
    on_attach = on_attach,
    flags = capabilities,
}

local pid = vim.fn.getpid()
require('lspconfig')['omnisharp'].setup{
    on_attach = on_attach,
    flags = capabilities,
    cmd = { '/Users/wesley/.cache/omnisharp-vim/omnisharp-roslyn/run', '--languageserver', '--hostPID', tostring(pid) }
}

