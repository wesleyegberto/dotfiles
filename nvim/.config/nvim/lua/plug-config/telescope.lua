
require('telescope').setup{
  defaults = {
    path_display = {
    'shorten'
    }
  }
}

require('telescope').load_extension('ultisnips')

-- require'telescope'.load_extension('project')

require('telescope').setup {
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

