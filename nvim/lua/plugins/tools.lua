return {
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-lua/popup.nvim' },

  { 'DanWlker/toolbox.nvim',
    config = function()
      require('toolbox').setup({
        commands = {
          {
            name = 'Copy relative path to clipboard',
            execute = function()
              local path = vim.fn.expand '%'
              vim.fn.setreg('+', path)
            end,
          },
          {
            name = 'Copy absolute path to clipboard',
            execute = function()
              local path = vim.fn.expand '%:p'
              vim.fn.setreg('+', path)
            end,
          },
          {
            name = 'Copy Vim table to clipboard',
            execute = function(v)
              vim.fn.setreg('+', vim.inspect(v))
            end,
          },
          {
            name = 'Print Vim table',
            execute = function(v)
              print(vim.inspect(v))
            end,
          },
          {
            name = 'Format JSON',
            execute = "%!jq '.'",
          },
          {
            name = 'Reload plugin',
            execute = function(name)
              package.loaded[name] = nil
              require(name).setup()
            end,
          },
        },
        config = true
      })
    end },

  { 'rmagatti/auto-session',
    config = function()
      vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
      require('auto-session').setup({
        log_level = 'warn',
        auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
        auto_session_enabled = true,
        auto_session_enable_last_session = false,
        auto_save_enabled = true,
        auto_restore_enabled = true,
        auto_session_suppress_dirs = { '~/', '~/Downloads', '~/Documents' }
      })
    end },
}
