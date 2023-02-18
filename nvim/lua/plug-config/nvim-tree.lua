-- === kyazdani42/nvim-tree.lua ===

local g = vim.g
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-web-devicons'.setup {
  default = true;
}

-- vim.cmd('highlight NvimTreeFolderIcon guibg=blue')

local nvim_tree_icons = {
   default = "",
   symlink = "",
   git = {
      untracked = '?',
      unstaged = '~',
      staged = '+',
      unmerged = '!',
      renamed = "➜",
      deleted = "✗",
      ignored = "◌",
   },
   folder = {
      -- disable indent_markers option to get arrows working or if you want both arrows and indent then just add the
      -- arrow icons in front of the default and opened folders below!
      -- arrow_open = "",
      -- arrow_closed = "",
      default = "",
      open = "",
      empty = "", -- 
      empty_open = "",
      symlink = "",
      symlink_open = "",
   },
}

local list = {
  { key = { "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb "edit" },
  { key = { "<2-RightMouse>", "<C-]>" }, cb = tree_cb "cd" },
  { key = "v", cb = tree_cb "vsplit" },
  { key = "<C-v>", cb = tree_cb "vsplit" },
  { key = "s", cb = tree_cb "split" },
  { key = "<C-x>", cb = tree_cb "split" },
  { key = "<C-t>", cb = tree_cb "tabnew" },
  { key = "<", cb = tree_cb "prev_sibling" },
  { key = ">", cb = tree_cb "next_sibling" },
  { key = "P", cb = tree_cb "parent_node" },
  { key = "<BS>", cb = tree_cb "close_node" },
  { key = "<S-CR>", cb = tree_cb "close_node" },
  { key = "<Tab>", cb = tree_cb "preview" },
  { key = "h", cb = tree_cb("close_node") },
  { key = "l", cb = tree_cb("edit") },
  { key = "K", cb = tree_cb "first_sibling" },
  { key = "J", cb = tree_cb "last_sibling" },
  { key = "I", cb = tree_cb "toggle_ignored" },
  { key = "H", cb = tree_cb "toggle_dotfiles" },
  { key = "R", cb = tree_cb "refresh" },
  { key = "a", cb = tree_cb "create" },
  { key = "d", cb = tree_cb "remove" },
  { key = "r", cb = tree_cb "rename" },
  { key = "<C->", cb = tree_cb "full_rename" },
  { key = "x", cb = tree_cb "cut" },
  { key = "c", cb = tree_cb "copy" },
  { key = "p", cb = tree_cb "paste" },
  { key = "y", cb = tree_cb "copy_name" },
  { key = "Y", cb = tree_cb "copy_path" },
  { key = "gy", cb = tree_cb "copy_absolute_path" },
  { key = "[c", cb = tree_cb "prev_git_item" },
  { key = "}c", cb = tree_cb "next_git_item" },
  { key = "-", cb = tree_cb "dir_up" },
  { key = "q", cb = tree_cb "close" },
  { key = "?", cb = tree_cb "toggle_help" },
}

require'nvim-tree'.setup {
   hijack_cursor = true,
   hijack_unnamed_buffer_when_opening = true,
   -- lsp_diagnostics = true,
   update_focused_file = {
      enable = true
   },
   view = {
      adaptive_size = false,
      width = 50,
      side = 'left',
      mappings = {
         list = list
      }
   },
   renderer = {
     icons = {
         show = {
            file = true,
            folder = true,
            git = true,
            folder_arrow = false
         },
         glyphs = nvim_tree_icons
      },
     indent_markers = {
       enable = true,
       icons = {
         corner = "└",
         edge = "│ ",
         none = "  ",
      },
     },
      highlight_opened_files = "all"
   },
   git = {
     enable = true,
     ignore = true
   },
   filters = {
     dotfiles = false,
     custom = {'^.git$', 'node_modules', '^.cache$', '.vscode'}
   }
}

-- hide statusline when nvim tree is opened
vim.cmd [[au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif]]
