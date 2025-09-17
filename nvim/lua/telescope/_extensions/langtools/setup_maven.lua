local pickers = require('telescope._extensions.langtools.action_picker')
local custom_actions = require('telescope._extensions.langtools.custom_actions')

local last_file = ''

local function create_test_current_file_args()
  local bufname = vim.fn.bufname()
  bufname:gsub("(/src/test/java)|(.java)", "")
  bufname, _ = bufname:gsub("(src/test/java/)", "")
  bufname, _ = bufname:gsub("(.java)", "")
  bufname, _ = bufname:gsub("(/)", ".")

  last_file = bufname
  return last_file
end

local maven_actions = {
  { action = 'mvn clean',        text = 'Clean' },
  { action = 'mvn compile',      text = 'Build' },
  { action = 'mvn package',      text = 'Package' },
  { action = 'mvn deploy',       text = 'Publish' },
  { action = 'mvn test',         text = 'Test' },
  { action = 'mvn test -Dtest=', text = 'Test_Current_File', format_args = create_test_current_file_args },
  { action = 'mvn test -Dtest=', text = 'Test_Last_File', format_args = function() return last_file end }
}

local M = {
  picker = function(opts) pickers.create_picker('Maven', maven_actions, opts) end,
  clean = function() custom_actions.run_action(maven_actions[1]) end,
  build = function() custom_actions.run_action(maven_actions[2]) end,
  package = function() custom_actions.run_action(maven_actions[3]) end,
  deploy = function() custom_actions.run_action(maven_actions[4]) end,
  test = function() custom_actions.run_action(maven_actions[5]) end,
  test_file = function() custom_actions.run_action(maven_actions[6]) end,
  test_last_file = function() custom_actions.run_action(maven_actions[7]) end,
}

return M
