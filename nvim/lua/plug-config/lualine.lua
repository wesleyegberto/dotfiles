local colors = {
  bg       = '#282c34',
  lightbg  = '#4d5163',
  yellow   = '#fabd2f',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#afd700',
  orange   = '#FF8800',
  purple   = '#5d4d7a',
  magenta  = '#d16d9e',
  grey     = '#c0c0c0',
  blue     = '#0087d7',
  red      = '#ec5f67',
}

local theme = {
  normal  = {
    a = { fg = colors.darkblue, bg = colors.blue,   gui = 'bold' },
    b = { fg = colors.gray, bg = colors.bg },
    c = { fg = colors.gray, bg = colors.bg },
  },
  insert  = { a = { fg = colors.darkblue, bg = colors.green,  gui = 'bold' } },
  visual  = { a = { fg = colors.darkblue, bg = colors.yellow, gui = 'bold' } },
  replace = { a = { fg = colors.darkblue, bg = colors.red,    gui = 'bold' } },
  command = { a = { fg = colors.darkblue, bg = colors.orange, gui = 'bold' } },
}

local function filesize_kb()
  local size = vim.fn.getfsize(vim.fn.expand('%:p'))
  if size <= 0 then return '' end
  return string.format('%.1f KB', size / 1024)
end

require('lualine').setup({
  options = {
    theme                = theme,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes   = {
      statusline = { 'NvimTree', 'telescope', 'floaterm', 'term', 'vista', 'dbui', 'claude', 'gemini' },
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      { 'branch', icon = '\u{e0a0}', color = { fg = colors.darkblue, bg = colors.magenta }, separator = { right = '' } },
      {
        'diff',
        symbols = {
          added    = '\u{f055} ',
          modified = '\u{f040} ',
          removed  = '\u{f056} ',
        },
        diff_color = {
          added    = { fg = colors.green },
          modified = { fg = colors.yellow },
          removed  = { fg = colors.red },
        },
        color = { fg = colors.darkblue, bg = colors.cyan },
        separator = { right = '' },
      },
      {
        'diagnostics',
        sources  = { 'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic' },
        symbols  = { error = '\u{f00d} ', warn = '\u{f071} ' },
        diagnostics_color = {
          error = { fg = colors.red },
          warn  = { fg = colors.orange },
          info  = { fg = colors.blue },
          hint = { fg = colors.green }
        },
        color = { fg = colors.yellow, bg = colors.purple },
        separator = { right = '' },
      },
    },
    lualine_c = {
      {
        'filename',
        path = 1,
        symbols = { modified = '\u{f040}', readonly = '\u{f023}' },
      },
    },
    lualine_x = {
      { filesize_kb, color = { fg = colors.darkblue,  bg = colors.yellow }, separator = { left = '' } },
      { 'encoding',  color = { fg = colors.darkblue, bg = colors.cyan },    separator = { left = '' } },
    },
    lualine_y = {
      { 'location', color = { fg = colors.darkblue, bg = colors.magenta } },
    },
    lualine_z = {
      { 'progress', color = { fg = colors.darkblue, bg = colors.blue } },
    },
  },
})
