-- === rmagatti/auto-session ===

local opts = {
  log_level = 'info',
  auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
  auto_session_enabled = true,
  auto_session_enable_last_session = true,
  auto_save_enabled = true,
  auto_restore_enabled = true,
  auto_session_suppress_dirs = { '~/', '~/Downloads', '~/Documents' }
}

require('auto-session').setup(opts)
