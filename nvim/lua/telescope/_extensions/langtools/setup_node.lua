
local pickers = require('telescope._extensions.langtools.action_picker')
local custom_actions = require('telescope._extensions.langtools.custom_actions')

local function create_test_current_file_args()
  return vim.fn.bufname()
end

local maven_actions = {
  { action = 'npm rimaf',     text = 'Clean' },
  { action = 'npm run build', text = 'Build' },
  { action = 'npm test',      text = 'Test' },
  { action = 'npm test ',     text = 'Test_Current_File', format_args = create_test_current_file_args }
}

local M = {
  picker = function(opts) pickers.create_picker('Maven', maven_actions, opts) end,
  clean = function() custom_actions.run_action(maven_actions[1]) end,
  build = function() custom_actions.run_action(maven_actions[2]) end,
  package = function() custom_actions.run_action(maven_actions[2]) end,
  test = function() custom_actions.run_action(maven_actions[3]) end,
  test_file = function() custom_actions.run_action(maven_actions[4]) end,
}

return M