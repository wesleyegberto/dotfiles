return {
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' },
    init = function()
      local opts = { noremap = true, silent = true, expr = false }
      vim.api.nvim_set_keymap("v", "<Leader>crv", ":Refactor extract_var<CR>", opts)
      vim.api.nvim_set_keymap("v", "<Leader>crV", ":Refactor inline_var<CR>", opts)
      vim.api.nvim_set_keymap("v", "<Leader>crm", ":Refactor extract<CR>", opts)
      vim.api.nvim_set_keymap("v", "<Leader>crM", ":Refactor inline", opts)
      vim.api.nvim_set_keymap("v", "<Leader>crb", ":Refactor extract_block", opts)
    end,
    config = function()
      require('refactoring').setup({
        prompt_func_return_type = {
          js = true, ts = true, java = true, python = true, lua = true,
        },
        prompt_func_param_type = {
          js = true, ts = true, java = true, python = true, lua = true,
        },
      })
    end
  },

  { 'Darazaki/indent-o-matic',
    config = function()
      require('indent-o-matic').setup({ max_lines = 1000, standard_widths = { 2, 4 } })
    end },

  { 'nvim-pack/nvim-spectre',
    cmd = 'Spectre',
    config = function()
      require('spectre').setup({
        line_sep_start = '┌-----------------------------------------',
        result_padding = '¦  ',
        line_sep       = '└-----------------------------------------',
        highlight = {
          ui = "String",
          search = "DiffChange",
          replace = "DiffDelete"
        },
        mapping = {
          ['tab']                = { map = '<Tab>',       cmd = "<cmd>lua require('spectre').tab()<cr>",                              desc = 'next query' },
          ['shift-tab']          = { map = '<S-Tab>',     cmd = "<cmd>lua require('spectre').tab_shift()<cr>",                        desc = 'previous query' },
          ['toggle_line']        = { map = 'dd',          cmd = "<cmd>lua require('spectre').toggle_line()<CR>",                      desc = 'toggle item' },
          ['enter_file']         = { map = '<cr>',        cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",             desc = 'open file' },
          ['send_to_qf']         = { map = '<leader>q',   cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",               desc = 'send all items to quickfix' },
          ['replace_cmd']        = { map = '<leader>c',   cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",              desc = 'input replace command' },
          ['show_option_menu']   = { map = '<leader>o',   cmd = "<cmd>lua require('spectre').show_options()<CR>",                     desc = 'show options' },
          ['run_current_replace']= { map = '<leader>krc', cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",      desc = 'replace current line' },
          ['run_replace']        = { map = '<leader>kR',  cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",              desc = 'replace all' },
          ['change_view_mode']   = { map = '<leader>kv',  cmd = "<cmd>lua require('spectre').change_view()<CR>",                     desc = 'change result view mode' },
          ['change_replace_sed'] = { map = '<leader>krs', cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",      desc = 'use sed to replace' },
          ['toggle_live_update'] = { map = '<leader>ku',  cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",               desc = 'update when vim writes to file' },
          ['toggle_ignore_case'] = { map = '<leader>ki',  cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",     desc = 'toggle ignore case' },
          ['toggle_ignore_hidden']={ map = '<leader>kh',  cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",          desc = 'toggle search hidden' },
          ['resume_last_search'] = { map = '<leader>kl',  cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",               desc = 'repeat last search' },
          ['select_template']    = { map = '<leader>rp',  cmd = "<cmd>lua require('spectre.actions').select_template()<CR>",         desc = 'pick template' },
          ['delete_line']        = { map = '<leader>rd',  cmd = "<cmd>lua require('spectre.actions').run_delete_line()<CR>",          desc = 'delete line' },
        }
      })
    end },

  { 'kylechui/nvim-surround',
    config = function() require('nvim-surround').setup() end },

  { 'echasnovski/mini.ai',
    config = function() require('mini.ai').setup() end },

  { 'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup() end },

  { 'wellle/targets.vim' },
  { 'mg979/vim-visual-multi' },
  { 'ntpeters/vim-better-whitespace' },

  { 'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end },

  { 'andymass/vim-matchup',
    config = function() require('match-up').setup({}) end },

  { 'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function() require('ufo').setup() end },
}
