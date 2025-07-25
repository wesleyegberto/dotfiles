local cmp = require('cmp')

local luasnip = require('luasnip')
local luasnip_loader = require('luasnip.loaders.from_vscode')

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
  }),
  formatting = {
    format = require('lspkind').cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      ellipsis_char = '...',
      before = function(entry, vim_item)
        return vim_item
      end
    })
  }
})

luasnip.filetype_extend("java", { "java-testing" })

luasnip_loader.lazy_load({
  includes = {
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
    -- '~/.config/nvim/snippets/java-tests',
    vim.fn.glob('~/.vscode/extensions/wesleyegberto.vscode-java-cloud-native-*', 1),
    vim.fn.glob('~/.vscode/extensions/wesleyegberto.vscode-java-spring-devtools-*', 1),
    vim.fn.glob('~/.vscode/extensions/wesleyegberto.globalpoints-snippets-*', 1),
    vim.fn.glob('~/.vscode/extensions/jorgeserrano.vscode-csharp-snippets-*', 1),
    vim.fn.glob('~/.vscode/extensions/johnpapa.angular2-*', 1),
    vim.fn.glob('~/.vscode/extensions/mikael.angular-beastcode-*', 1),
    vim.fn.glob('~/.vscode/extensions/lunuan.kubernetes-templates-*', 1),
  }
})

vim.cmd([[
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]])

-- === AI completion ===
-- Copilot
vim.b.copilot_enabled = false
vim.g.copilot_no_tab_map = true

if vim.b.copilot_enabled then
  vim.keymap.set('i', '<C-y>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })

  vim.cmd([[
    let g:copilot_filetypes = {
      \ '*': v:false,
      \ 'python': v:true,
      \ 'lua': v:true,
      \ 'java': v:true,
      \ 'javascript': v:true,
      \ 'typescript': v:true,
      \ 'csharp': v:true,
      \ 'shell': v:true,
      \ }
  ]])
end

-- Augument
vim.g.augment_disable_completions = false
-- vim.g.augment_disable_tab_mapping = true -- until fix C-y mapping

if not vim.g.augment_disable_completions then
  -- vim.keymap.set('i', '<C-y>', 'augment#Accept()', { expr = true, replace_keycodes = false })
end

-- Claude AI (https://github.com/yetone/avante.nvim?tab=readme-ov-file#key-bindings)
-- views can only be fully collapsed with the global statusline
-- vim.opt.laststatus = 3
-- require('avante').setup({
--   provider = "claude",
--   suggestion = {
--     debounce = 1000,
--     throttle = 1000,
--   }
-- })

