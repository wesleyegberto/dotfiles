-- === kyazdani42/nvim-tree.lua ===
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

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', '<C-t>', api.node.open.tab, opts('Open: New Tab'))
  vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
  vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
  vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
  vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', '<S-CR>', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
  vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
  vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
  vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', '<C->', api.fs.rename_sub, opts('Rename: Omit Filename'))
  vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
  vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
  vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
  vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
  vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
  vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
  vim.keymap.set('n', '[c', api.node.navigate.git.prev, opts('Prev Git'))
  vim.keymap.set('n', '}c', api.node.navigate.git.next, opts('Next Git'))
  vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end


require'nvim-tree'.setup {
   on_attach = on_attach,
   hijack_cursor = true,
   hijack_unnamed_buffer_when_opening = true,
   -- lsp_diagnostics = true,
   update_focused_file = {
      enable = true
   },
   view = {
      adaptive_size = false,
      width = 50,
      side = 'left'
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

