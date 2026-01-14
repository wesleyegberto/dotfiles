require('maximize').setup()

require('harpoon'):setup()

require('bqf').setup()

require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }

require('Comment').setup()

require('indent-o-matic').setup({
  max_lines = 1000,
  standard_widths = { 2, 4 },
})

require('nvim-autopairs').setup()
require('nvim-surround').setup()
require('mini.ai').setup()
require('match-up').setup({})

require('jabs').setup {
  position = 'center',
  width = 80,
  height = 10,
  border = 'rounded',
  preview_position = 'right',
  preview = {
    width = 50,
    height = 30,
    border = 'single',
  },
  keymap = {
    close = 'd',
    preview = 'p'
  }
}

require('spectre').setup({
  line_sep_start = '┌-----------------------------------------',
  result_padding = '¦  ',
  line_sep       = '└-----------------------------------------',
  highlight = {
      ui = "String",
      search = "DiffChange",
      replace = "DiffDelete"
  },
  mapping={
    ['tab'] = {
        map = '<Tab>',
        cmd = "<cmd>lua require('spectre').tab()<cr>",
        desc = 'next query'
    },
    ['shift-tab'] = {
        map = '<S-Tab>',
        cmd = "<cmd>lua require('spectre').tab_shift()<cr>",
        desc = 'previous query'
    },
    ['toggle_line'] = {
        map = "dd",
        cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
        desc = "toggle item"
    },
    ['enter_file'] = {
        map = "<cr>",
        cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
        desc = "open file"
    },
    ['send_to_qf'] = {
        map = "<leader>q",
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
        desc = "send all items to quickfix"
    },
    ['replace_cmd'] = {
        map = "<leader>c",
        cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
        desc = "input replace command"
    },
    ['show_option_menu'] = {
        map = "<leader>o",
        cmd = "<cmd>lua require('spectre').show_options()<CR>",
        desc = "show options"
    },
    ['run_current_replace'] = {
      map = "<leader>krc",
      cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
      desc = "replace current line"
    },
    ['run_replace'] = {
        map = "<leader>kR",
        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
        desc = "replace all"
    },
    ['change_view_mode'] = {
        map = "<leader>kv",
        cmd = "<cmd>lua require('spectre').change_view()<CR>",
        desc = "change result view mode"
    },
    ['change_replace_sed'] = {
      map = "<leader>krs",
      cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",
      desc = "use sed to replace"
    },
    ['toggle_live_update']={
      map = "<leader>ku",
      cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
      desc = "update when vim writes to file"
    },
    ['toggle_ignore_case'] = {
      map = "<leader>ki",
      cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
      desc = "toggle ignore case"
    },
    ['toggle_ignore_hidden'] = {
      map = "<leader>kh",
      cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
      desc = "toggle search hidden"
    },
    ['resume_last_search'] = {
      map = "<leader>kl",
      cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
      desc = "repeat last search"
    },
    ['select_template'] = {
        map = '<leader>rp',
        cmd = "<cmd>lua require('spectre.actions').select_template()<CR>",
        desc = 'pick template',
    },
    ['delete_line'] = {
        map = '<leader>rd',
        cmd = "<cmd>lua require('spectre.actions').run_delete_line()<CR>",
        desc = 'delete line',
    }
  }
})

-- :ColorizerToggle
require 'colorizer'.setup {
  'css',
  'html',
  'javascript',
  lua = {
    names = false
  },
}

-- Commands
require('toolbox').setup({
  commands = {
    {
      name = 'Copy relative path to clipboard',
      execute = function()
        local path = vim.fn.expand '%'
        vim.fn.setreg('+', path)
      end,
    },
    {
      name = 'Copy absolute path to clipboard',
      execute = function()
        local path = vim.fn.expand '%:p'
        vim.fn.setreg('+', path)
      end,
    },
    {
      name = 'Copy Vim table to clipboard',
      execute = function(v)
        vim.fn.setreg('+', vim.inspect(v))
      end,
    },
    {
      name = 'Print Vim table',
      execute = function(v)
        print(vim.inspect(v))
      end,
    },
    {
      name = 'Format JSON',
      execute = "%!jq '.'",
    },
    {
      name = 'Reload plugin',
      execute = function(name)
        package.loaded[name] = nil
        require(name).setup()
      end,
    },
  },
  config = true
})
