return {
  { 'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind-nvim',
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local luasnip_loader = require("luasnip.loaders.from_vscode")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion    = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-d>"]     = cmp.mapping.scroll_docs(-4),
          ["<C-f>"]     = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"]     = cmp.mapping.abort(),
          ["<Esc>"]     = cmp.mapping.abort(),
          ["<CR>"]      = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ["<C-n>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-p>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer",  option = { keyword_length = 5 } },
          { name = "luasnip" },
          { name = "path" },
        }),
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = "...",
            before = function(entry, vim_item)
              return vim_item
            end,
          }),
        },
      })

      luasnip_loader.lazy_load({
        includes = {
          "python", "javascript", "csharp", "lua",
          "shell", "html", "css", "kubernetes", "markdown",
        },
      })

      luasnip_loader.lazy_load({
        paths = {
          "~/.config/nvim/snippets/java",
          vim.fn.glob("~/.vscode/extensions/wesleyegberto.vscode-java-tests-*", 1),
          vim.fn.glob("~/.vscode/extensions/wesleyegberto.vscode-java-cloud-native-*", 1),
          vim.fn.glob("~/.vscode/extensions/wesleyegberto.vscode-java-spring-devtools-*", 1),
          vim.fn.glob("~/.vscode/extensions/wesleyegberto.work-snippets-*", 1),
          vim.fn.glob("~/.vscode/extensions/jorgeserrano.vscode-csharp-snippets-*", 1),
          vim.fn.glob("~/.vscode/extensions/johnpapa.angular2-*", 1),
          vim.fn.glob("~/.vscode/extensions/mikael.angular-beastcode-*", 1),
          vim.fn.glob("~/.vscode/extensions/lunuan.kubernetes-templates-*", 1),
        },
      })

      vim.cmd([[
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
inoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
      ]])

    end },
}
