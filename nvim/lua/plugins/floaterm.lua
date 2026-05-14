return {
  { 'voldikss/vim-floaterm',
    cmd  = { 'FloatermNew', 'FloatermToggle', 'FloatermNext', 'FloatermPrev' },
    keys = { '<F1>', '<F2>', '<F3>', '<F4>' },
    init = function()
      vim.g.floaterm_keymap_toggle = '<F1>'
      vim.g.floaterm_keymap_prev   = '<F2>'
      vim.g.floaterm_keymap_next   = '<F3>'
      vim.g.floaterm_keymap_new    = '<F4>'
    end,
    config = function()
      vim.g.floaterm_gitcommit  = 'floaterm'
      vim.g.floaterm_autoinsert = 1
      vim.g.floaterm_position   = 'center'
      vim.g.floaterm_width      = 0.8
      vim.g.floaterm_height     = 0.8
      vim.g.floaterm_wintitle   = 0
      vim.g.floaterm_wintype    = 'floating'
      vim.g.floaterm_autoclose  = 1

      vim.cmd('hi Floaterm guibg=black')
      vim.cmd('hi FloatermBorder guibg=none guifg=cyan')
    end },
}
