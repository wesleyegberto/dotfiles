require('bqf').setup()

require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }

require('Comment').setup()

require('indent-o-matic').setup({
  max_lines = 1000,
  standard_widths = { 2, 4 },
})

require('nvim-autopairs').setup()
require('nvim-surround').setup()

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
