return {
  { 'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', lazy = true },
      { 'nvim-telescope/telescope-ui-select.nvim', lazy = true },
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      local vimgrep_arguments = { unpack(require('telescope.config').values.vimgrep_arguments) }
      table.insert(vimgrep_arguments, '--hidden')
      table.insert(vimgrep_arguments, '--glob')
      table.insert(vimgrep_arguments, '!**/.git/*')

      telescope.setup({
        defaults = {
          prompt_prefix = '>',
          selection_caret = '> ',
          entry_prefix = '  ',
          path_display = { 'shorten' },
          initial_mode = 'insert',
          set_env = { COLORTERM = 'truecolor' },
          vimgrep_arguments = vimgrep_arguments,
          file_ignore_patterns = {
            '.git/', '%.jpg', '%.jpeg', '%.png', '%.svg',
            '%.otf', '%.ttf', '%.ipynb', '__pycache__', 'node_modules',
          },
          file_sorter = require('telescope.sorters').get_fuzzy_file,
          mappings = {
            i = {
              ['<Esc>'] = actions.close,
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,
              ['<C-o>'] = function() end,
              ['<TAB>'] = actions.toggle_selection + actions.move_selection_next,
              ['<C-s>'] = actions.send_selected_to_qflist,
              ['<C-q>'] = actions.send_to_qflist,
            }
          },
        },
        pickers = {
          buffers = {
            mappings = { i = { ['<C-d>'] = actions.delete_buffer + actions.move_to_top } }
          },
          find_files = {
            find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
          },
        },
        extensions = {
          fzf = {},
          ['ui-select'] = { require('telescope.themes').get_dropdown {} },
          advanced_git_search = {
            diff_plugin = 'fugitive',
            git_flags = {},
            git_diff_flags = {},
            show_builtin_git_pickers = false,
            telescope_theme = {
              show_custom_functions = { layout_config = { width = 0.4, height = 0.4 } },
            },
          },
        },
      })

      telescope.load_extension('fzf')
      telescope.load_extension('ui-select')
      telescope.load_extension('harpoon')
      telescope.load_extension('advanced_git_search')
      telescope.load_extension('live_multigrep')
    end },

  { 'axkirillov/easypick.nvim',
    cmd = 'Easypick',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require('easypick').setup({
        pickers = {
          {
            name = 'conflicts',
            command = 'git diff --name-only --diff-filter=U --relative',
            previewer = require('easypick').previewers.file_diff()
          },
        }
      })
    end },
}
