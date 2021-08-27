local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    prompt_prefix = ">",
    selection_caret = "> ",
    entry_prefix = "  ",
    path_display = {
      'shorten'
    },
    initial_mode = 'insert',
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    mappings = {
      i = {
        ["<Esc>"] = actions.close,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-o>'] = function()
            return
        end,
        ['<TAB>'] = actions.toggle_selection + actions.move_selection_next,
        ['<C-s>'] = actions.send_selected_to_qflist,
        ['<C-q>'] = actions.send_to_qflist,
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

