local cmp = require'cmp'
local luasnip = require'luasnip'

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Esc>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
    }),
    ['<C-n>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-p>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer', option = { keyword_length = 5 } },
    { name = 'luasnip' },
    { name = 'path' },
  })
})

local luasnip_loader = require("luasnip.loaders.from_vscode")

luasnip_loader.lazy_load({
  includes = {
    'java',
    'python',
    'javascript',
    'csharp',
    'lua',
    'shell',
    'html',
    'css',
    'kubernetes',
    'markdown'
  }
})

luasnip_loader.lazy_load({
  paths = {
    '~/.config/nvim/snippets/java',
    '~/.config/nvim/snippets/java-tests',
    '.vscode/extensions/wesleyegberto.globalpoints-snippets-0.0.4',
    '.vscode/extensions/johnpapa.angular2-13.0.0',
    '.vscode/extensions/jorgeserrano.vscode-csharp-snippets-1.1.0',
    '.vscode/extensions/mikael.angular-beastcode-10.0.3',
    '.vscode/extensions/lunuan.kubernetes-templates-1.3.1',
  }
})

