return {
  { 'github/copilot.vim',
    config = function()
      vim.g.copilot_enabled = false

      if vim.g.copilot_enabled then
        vim.cmd([[
          let g:copilot_filetypes = {
            \ '*': v:false,
            \ 'python': v:true,
            \ 'lua': v:true,
            \ 'java': v:true,
            \ 'javascript': v:true,
            \ 'typescript': v:true,
            \ 'csharp': v:true,
            \ 'shell': v:true,
            \ }
        ]])
      end
    end },

  { 'folke/sidekick.nvim',
    config = function()
      if vim.g.sidekick_nes ~= false then
        local sidekick = require("sidekick")

        sidekick.setup({
          cli = {
            mux = {
              enabled = false,
              backend  = "tmux",
            },
            win = {
              keys = {
                stopinsert = { "<esc>", "stopinsert", mode = "t" },
                hide_n     = { "q", "hide", mode = "n" },
                win_c      = { "<c-w>c", "hide" },
                win_p      = { "<c-w>p", "blur" },
                win_w      = { "<c-w>w", "blur" },
                blur       = { "<c-o>", "blur" },
                prompt     = { "<c-p>", "prompt" },
              },
            },
          },
        })

        vim.keymap.set("n", "<Tab>", function()
          if not sidekick.nes_jump_or_apply() then
            return "<Tab>"
          end
        end, { desc = "AI jump or apply" })
      end
    end },

  {
    'ThePrimeagen/99',
    dependencies = { 'hrsh7th/nvim-cmp', 'nvim-telescope/telescope.nvim' },
    init = function()
      vim.keymap.set("n", "<leader>aP", function() require('99.extensions.telescope').select_provider() end, { desc = "99: Select Provider" })
      vim.keymap.set("n", "<leader>aM", function() require('99.extensions.telescope').select_model() end, { desc = "99: Select Model" })
      vim.keymap.set("n", "<leader>acl", function() require("99").view_logs() end,         { desc = "99: View logs" })
      vim.keymap.set("n", "<leader>acs", function() require("99").search() end,            { desc = "99: Search" })
      vim.keymap.set("n", "<leader>acp", function() require("99").visual() end,            { desc = "99: Custom prompt" })
      vim.keymap.set("v", "<leader>acp", function() require("99").visual() end,            { desc = "99: Custom prompt" })
      vim.keymap.set("n", "<leader>acX", function() require("99").stop_all_requests() end, { desc = "99: Stop all requests" })
    end,
    config = function()
      local _99 = require("99")
      local cwd = vim.uv.cwd()
      local basename = vim.fs.basename(cwd)

      _99.setup({
        logger = {
          level          = _99.DEBUG,
          path           = "/tmp/" .. basename .. ".99.debug",
          print_on_error = true,
        },
        provider = _99.Providers.ClaudeCodeProvider,
        model    = "claude-sonnet-4-6",
        completion = {
          custom_rules = {
            (os.getenv('AGENT_DIR') or "") .. "/skills/"
          },
          source = "cmp",
        },
        md_files = { "AGENTS.md" },
      })
    end
  },
}
