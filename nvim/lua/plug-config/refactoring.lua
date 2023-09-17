-- === ThePrimeagen/refactoring.nvim ===
local map = vim.api.nvim_set_keymap

local refactor = require("refactoring")
refactor.setup({
   -- prompt for return type
    prompt_func_return_type = {
        js = true,
        ts = true,
        java = true,
        python = true,
        lua = true,
    },
    -- prompt for function parameters
    prompt_func_param_type = {
        js = true,
        ts = true,
        java = true,
        python = true,
        lua = true,
    },
})

local opts = {noremap = true, silent = true, expr = false}
-- Code Refactoring mappings
map("v", "<Leader>crv", ":Refactor extract_var<CR>", opts)
map("v", "<Leader>crV", ":Refactor inline_var<CR>", opts)
map("v", "<Leader>crm", ":Refactor extract<CR>", opts)
map("v", "<Leader>crM", ":Refactor inline", opts)
map("v", "<Leader>crb", ":Refactor extract_block", opts)
map("v", "<Leader>crm", ":lua require('refactoring').select_refactor()<CR>", opts)

