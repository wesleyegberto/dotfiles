local utils = require'utils'

local maven_options = require'telescope._extensions.langtools.setup_maven'
local dotnet_options = require'telescope._extensions.langtools.setup_dotnet'

local defaultConf = {
  language = 'none'
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

  -- utils.dump(LangTools.config)

  if LangTools.config.language == 'java' then
    copy_attr_to_module(maven_options)
  elseif LangTools.config.language == 'dotnet' then
    copy_attr_to_module(dotnet_options)
  end
end
return {
  setup = setup,
  exports = LangTools.exports
}