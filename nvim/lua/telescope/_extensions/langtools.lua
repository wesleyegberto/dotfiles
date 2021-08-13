local has_telescope, telescope = pcall(require, 'telescope')
if not has_telescope then
  error('This plugin requires nvim-telescope/telescope.nvim')
end

local main = require'telescope._extensions.langtools.main'

return telescope.register_extension {
  setup = main.setup,
  exports = main.exports
  -- exports = {
  --   -- Java
  --   maven = maven_options.picker,
  --   maven_clean = maven_options.clean,
  --   maven_build = maven_options.build,
  --   maven_package = maven_options.package,
  --   maven_test = maven_options.test,
  --   -- Dotnet Core
  --   dotnet = dotnet_options.picker,
  --   dotnet_clean = dotnet_options.clean,
  --   dotnet_build = dotnet_options.build,
  --   dotnet_package = dotnet_options.package,
  --   dotnet_test = dotnet_options.test,
  -- }
}