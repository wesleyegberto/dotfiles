-- === ThePrimeagen/refactoring.nvim ===
local map = vim.api.nvim_set_keymap

local refactor = require("refactoring")
refactor.setup()

-- telescope refactoring helper
local function refactor(prompt_bufnr)
    local content = require("telescope.actions.state").get_selected_entry(
        prompt_bufnr
    )
    require("telescope.actions").close(prompt_bufnr)
    require("refactoring").refactor(content.value)
end

M = {}
M.refactors = function()
    require("telescope.pickers").new({}, {
        prompt_title = "refactors",
        finder = require("telescope.finders").new_table({
            results = require("refactoring").get_refactors(),
        }),
        sorter = require("telescope.config").values.generic_sorter({}),
        attach_mappings = function(_, map)
            map("i", "<CR>", refactor)
            map("n", "<CR>", refactor)
            return true
        end
    }):find()
end

local opts = {noremap = true, silent = true, expr = false}
-- Code Refactoring mappings
map("v", "<Leader>cre", [[<Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], opts)
map("v", "<Leader>crf", [[<Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], opts)
map("v", "<Leader>crt", [[<Cmd>lua M.refactors()<CR>]], opts)
