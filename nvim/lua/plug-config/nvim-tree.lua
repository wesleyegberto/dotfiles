-- === kyazdani42/nvim-tree.lua ===

local g = vim.g

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

-- vim.cmd('highlight NvimTreeFolderIcon guibg=blue')

g.nvim_tree_width = 40
g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
g.nvim_tree_gitignore = 1
g.nvim_tree_follow = 1
g.nvim_tree_lsp_diagnostics = 1
-- g.nvim_tree_highlight_opened_files = 1

g.nvim_tree_bindings = {
  { key = "h", cb = tree_cb("close_node") },
  { key = "l", cb = tree_cb("edit") }
}

-- hide statusline when nvim tree is opened
vim.cmd [[au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif]]