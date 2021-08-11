local pickers = require'telescope._extensions.langtools.action_picker'
local custom_actions = require'telescope._extensions.langtools.custom_actions'

local dotnet_options = {
  { action = 'dotnet clean',              text = 'Clean' },
  { action = 'dotnet build',              text = 'Build' },
  { action = 'dotnet publish -c Release', text = 'Package' },
  { action = 'dotnet test',               text = 'Test' }
}

local M = {
  picker = function(opts) pickers.create_picker('Dotnet', dotnet_options, opts) end,
  clean = function() custom_actions.run_action(dotnet_options[1]) end,
  build = function() custom_actions.run_action(dotnet_options[2]) end,
  package = function() custom_actions.run_action(dotnet_options[3]) end,
  test = function() custom_actions.run_action(dotnet_options[4]) end,
}

return M