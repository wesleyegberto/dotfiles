local pickers = require('telescope._extensions.langtools.action_picker')
local custom_actions = require('telescope._extensions.langtools.custom_actions')

local last_file = ''

local function create_test_current_file_args()
  last_file = vim.fn.bufname()
  return last_file
end

local maven_actions = {
  { action = 'python3 -m py_compile ', text = 'Build', format_args = create_test_current_file_args },
  { action = 'python3 -m pytest -v',   text = 'Test' },
  { action = 'python3 -m pytest -v ',  text = 'Test_Current_File', format_args = create_test_current_file_args },
  { action = 'python3 -m pytest -v ',  text = 'Test_Last_File', format_args = function() return last_file end }
}

local M = {
  picker = function(opts) pickers.create_picker('Maven', maven_actions, opts) end,
  build = function() custom_actions.run_action(maven_actions[1]) end,
  test = function() custom_actions.run_action(maven_actions[2]) end,
  test_file = function() custom_actions.run_action(maven_actions[3]) end,
  test_last_file = function() custom_actions.run_action(maven_actions[4]) end,
}

return M
