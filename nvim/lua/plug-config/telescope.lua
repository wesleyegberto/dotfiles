local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    prompt_prefix = ">",
    selection_caret = "> ",
    entry_prefix = "  ",
    path_display = {
      'shorten'
    },
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    mappings = {
      i = {
        ["<Esc>"] = actions.close
      }
    }
  },
  extensions = {
    project = {
      base_dirs = {
        {path = '~/projects/github', max_depth = 3},
        {'~/projects/globalpoints/git', max_depth = 4}
      }
      --hidden_files = true -- default: false
    }
  }
}

require('telescope').load_extension('ultisnips')

