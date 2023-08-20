local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')
local finders = require('telescope.finders')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local custom_actions = require('telescope._extensions.langtools.custom_actions')

local function create_picker(tool_name, tool_options, opts)
  opts = opts or {}

  local default_options = {
    results_title = tool_name,
    finder = finders.new_table {
      results = tool_options,
      entry_maker = function(result)
        return {
          value = result,
          display = tool_name .. ' ' .. result.text,
          ordinal = 1,
          valid = true
        }
      end
    },
    sorter = sorters.get_fuzzy_file(),
    -- previewer = previewers.vim_buffer_cat.new {},
    previewer = nil,
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        custom_actions.run_action(selection.value)
      end)

      return true
    end
  }

  pickers.new(opts, default_options):find()
end

return { create_picker = create_picker }
