local previewers = require('telescope.previewers')
local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')
local finders = require('telescope.finders')

local M = {}

M.get_pods = function()
  pickers.new {
    results_title = 'K8s Pods',
    finder = finders.new_oneshot_job({'kubectl', 'get', 'pods'}),
    sorter = sorters.get_fuzzy_file(),
    previewer = previewers.new_termopen_previewer {
      get_command = function(entry)
        return {'kubectl', 'describe', 'pods', entry.value}
      end
    },
  }:find()
end

M.logs = function()
  pickers.new {
    results_title = 'K8s Pod Logs',
    finder = finders.new_oneshot_job({'kubectl', 'get', 'pods'}),
    sorter = sorters.get_fuzzy_file(),
    previewer = previewers.new_termopen_previewer {
      get_command = function(entry)
        return {'kubectl', 'logs', entry.value}
      end
    },
  }:find()
end

return M
