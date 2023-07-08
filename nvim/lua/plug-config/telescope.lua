local telescope = require('telescope')
local actions = require('telescope.actions')
local easypick = require("easypick")


-- config to search in hidden files
local telescopeConfig = require("telescope.config")
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

telescope.setup {
  defaults = {
    prompt_prefix = ">",
    selection_caret = "> ",
    entry_prefix = "  ",
    path_display = {
      'shorten'
    },
    initial_mode = 'insert',
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    vimgrep_arguments = vimgrep_arguments,
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
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
        }
      }
    },
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
  },
  extensions = {
   project = {
      base_dirs = {
        {path = '~/projects/github', max_depth = 3},
        {'~/projects/globalpoints/git', max_depth = 4}
      },
      hidden_files = false
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    },
    advanced_git_search = {
        -- fugitive or diffview
      diff_plugin = "fugitive",
      -- customize git in previewer
      -- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
      git_flags = {},
      -- customize git diff in previewer
      -- e.g. flags such as { "--raw" }
      git_diff_flags = {},
      -- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
      show_builtin_git_pickers = false,
      -- Telescope layout setup
      telescope_theme = {
        -- e.g. realistic example
        show_custom_functions = {
            layout_config = { width = 0.4, height = 0.4 },
        },
      }
    }
  },
}

telescope.load_extension('ui-select')
telescope.load_extension('project')
telescope.load_extension('harpoon')
telescope.load_extension("advanced_git_search")

easypick.setup({
  pickers = {
    -- list files that have conflicts with diffs in preview
    {
      name = "conflicts",
      command = "git diff --name-only --diff-filter=U --relative",
      previewer = easypick.previewers.file_diff()
    },
  }
})

