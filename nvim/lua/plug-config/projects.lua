-- === rmagatti/auto-session ===

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

require('auto-session').setup({
  log_level = 'info',
  auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
  auto_session_enabled = true,
  auto_session_enable_last_session = false,
  auto_save_enabled = true,
  auto_restore_enabled = true,
  auto_session_suppress_dirs = { '~/', '~/Downloads', '~/Documents' }
})

require('cd-project').setup({
  projects_config_filepath = vim.fs.normalize(vim.fn.stdpath("config") .. "/.cd-project.nvim.json"),
  project_dir_pattern = { ".git", ".gitignore", "pom.xml", "package.json", "*.csproj" },
  choice_format = "both",
  projects_picker = "telescope",
})

