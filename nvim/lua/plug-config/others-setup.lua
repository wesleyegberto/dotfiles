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

require('spectre').setup()

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
