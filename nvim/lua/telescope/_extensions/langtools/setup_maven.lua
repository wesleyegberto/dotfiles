
local pickers = require'telescope._extensions.langtools.action_picker'

local custom_actions = require'telescope._extensions.langtools.custom_actions'

local maven_actions = {
  { action = 'mvn clean',   text = 'Clean' },
  { action = 'mvn compile', text = 'Build' },
  { action = 'mvn package', text = 'Package' },
  { action = 'mvn test',    text = 'Test' }
}

return {
  picker = function(opts) pickers.create_picker('Maven', maven_actions, opts) end,
  clean = function() custom_actions.run_action(maven_actions[1]) end,
  build = function() custom_actions.run_action(maven_actions[2]) end,
  package = function() custom_actions.run_action(maven_actions[3]) end,
  test = function() custom_actions.run_action(maven_actions[4]) end,
}
