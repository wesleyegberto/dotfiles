local utils = require('custom/utils')

local defaultConf = {
  language = 'java'
}

local LangTools = {
  config = defaultConf,
  exports = {}
}

local function copy_attr_to_module(obj)
  for k, v in pairs(obj) do
    LangTools.exports[k] = v
  end
end


local function setup(config)
  LangTools.config = config or defaultConf

  if utils.isempty(LangTools.config.language) then
    LangTools.config.language = 'none'
  end

  if LangTools.config.language == 'java' then
    local maven_options = require('telescope._extensions.langtools.setup_maven')
    copy_attr_to_module(maven_options)

  elseif LangTools.config.language == 'dotnet' then
    local dotnet_options = require('telescope._extensions.langtools.setup_dotnet')
    copy_attr_to_module(dotnet_options)

  elseif LangTools.config.language == 'node' then
    local node_options = require('telescope._extensions.langtools.setup_node')
    copy_attr_to_module(node_options)

  elseif LangTools.config.language == 'python' then
    local node_options = require('telescope._extensions.langtools.setup_python')
    copy_attr_to_module(node_options)
  end
end

-- setup(defaultConf)

return {
  setup = setup,
  exports = LangTools.exports
}
