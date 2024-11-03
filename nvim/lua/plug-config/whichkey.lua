-- === folke/which-key.nvim ===

local wk = require("which-key")

vim.cmd([[
highlight default link WhichKey          Operator
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyDesc      Operator
]])

-- use the default settings
wk.setup {
  preset = 'modern',
  delay = 1000,
  notify = false,
  plugins = {
    marks = false,         -- shows a list of your marks on ' and `
    presets = {
      operators = false,   -- adds help for operators like d, y, ...
      motions = false,     -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,      -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = true,            -- bindings for folds, spelling and others prefixed with z
      g = true,            -- bindings for prefixed with g
    },
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  win = {
    no_overlap = true,
    title = true,
    border = "single", -- none, single, double, shadow
    title_pos = 'center',
    padding = { 1, 1 }
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 2,                    -- spacing between columns
  },
  sort = { 'local', 'order', 'group', 'alphanum', 'mod' },
  show_help = true,
  show_keys = true,
  -- triggers = "auto",
  triggers = { "<leader>" },
  replace = {
    key = {
      function(key)
        return require("which-key.view").format(key)
      end,
    },
    desc = {
      { "<Plug>%(?(.*)%)?", "%1" },
      { "^%+",              "" },
      { "<[cC]md>",         "" },
      { "<[cC][rR]>",       "" },
      { "<[sS]ilent>",      "" },
      { "^lua%s+",          "" },
      { "^call%s+",         "" },
      { "^:%s*",            "" },
    },
  },
}

wk.add({
  { '<leader>w',   group = 'Windows' },
  { '<leader>ww',  '<C-w>w',         desc = 'other-window' },
  { '<leader>wq',  '<C-w>q',         desc = 'quit window' },
  { '<leader>wc',  '<C-w>c',         desc = 'close window' },
  { '<leader>wd',  ':Bdelete<CR>',   desc = 'close buffer' },
  { '<leader>wx',  ':Bwipeout<CR>',  desc = 'close buffer' },
  { '<leader>w-',  '<C-w>s',         desc = 'split window below' },
  { '<leader>w|',  '<C-w>v',         desc = 'split window right' },
  { '<leader>w2',  '<C-w>v',         desc = 'layout double columns' },
  { '<leader>wh',  '<C-w>h',         desc = 'window left' },
  { '<leader>wj',  '<C-w>j',         desc = 'window below' },
  { '<leader>wl',  '<C-w>l',         desc = 'window right' },
  { '<leader>wk',  '<C-w>k',         desc = 'window up' },
  { '<leader>wH',  '<C-w>5<',        desc = 'expand window left' },
  { '<leader>wJ',  ':resize -5<CR>', desc = 'expand window below' },
  { '<leader>wL',  '<C-w>5>',        desc = 'expand window right' },
  { '<leader>wK',  ':resize +5<CR>', desc = 'expand window up' },
  { '<leader>w=',  '<C-w>=',         desc = 'balance window' },
  { '<leader>ws',  '<C-w>s',         desc = 'split window below' },
  { '<leader>wv',  '<C-w>v',         desc = 'split window aside' },
  { '<leader>wf',  '<C-w>f',         desc = 'flip windows' },
  { '<leader>wth', '<C-w>t<C-w>H',   desc = 'flip horiz-to-vert' },
  { '<leader>wtk', '<C-w>t<C-w>K',   desc = 'flip vert-to-horiz' },
  { '<leader>w?',  ':Windows<CR>',   desc = 'fzf window' }
})


wk.add({
  { '<leader>f',   group = 'Telescope' },
  { '<leader>f_',  ':Telescope<CR>',                             desc = 'Open Telescope' },
  { '<leader>f;',  ':Telescope commands<CR>',                    desc = 'Telescope Commands' },
  { '<leader>fc',  ':lua require("toolbox").show_picker()<CR>',  desc = 'Toolbox Commands' },
  { '<leader>fvw', ':Windows<CR>',                               desc = 'View Window' },
  { '<leader>ff',  ':Telescope find_files<CR>',                  desc = 'File' },
  { '<leader>fF',  ':Telescope frecency<CR>',                    desc = 'Frequency' },
  { '<leader>fb',  ':Telescope buffers<CR>',                     desc = 'Buffers' },
  { '<leader>fL',  ':Telescope current_buffer_fuzzy_find<CR>',   desc = 'Buffer line' },
  { '<leader>fm',  ':Telescope marks<CR>',                       desc = 'Marks' },
  { '<leader>ft',  ':Telescope tags<CR>',                        desc = 'Tags' },
  { '<leader>fT',  ':Telescope current_buffer_tags<CR>',         desc = 'Buffer tags' },
  { '<leader>fr',  ':Telescope live_grep<CR>',                   desc = 'With rg' },
  { '<leader>fS',  ':Telescope session-lens search_session<CR>', desc = 'Sessions' },
  { '<leader>fX',  ':Telescope tmux sessions<CR>',               desc = 'Tmux sessions' },
  { '<leader>fw',  ':Telescope grep_string<CR>',                 desc = 'Word under cursor' },
  { '<leader>fP',  ':CdProject<CR>',                             desc = 'Find projects' },
  { '<leader>f?',  ':Telescope help_tags<CR>',                   desc = 'Help' },
  { '<leader>f/',  ':Telescope search_history<CR>',              desc = 'Commands' },

  { '<leader>fg',  group = 'Git' },
  { '<leader>fgs', ':Telescope git_status<CR>',                  desc = 'Modifiled git files' },
  { '<leader>fgf', ':Telescope git_files<CR>',                   desc = 'Git files' },
  { '<leader>fgm', ':Easypick conflicts<CR>',                    desc = 'Git conflicts' },
  { '<leader>fgc', ':Telescope git_commits<CR>',                 desc = 'Commit' },
  { '<leader>fgC', ':Telescope git_bcommits<CR>',                desc = 'Buffer commit' },
})

-- use `<CR>` to open file from current items
-- use `dd` to toggle search result items
-- use `<leader>rc` to run the replace the current items
-- use `<leader>R` to replace all result items
wk.add({
  { '<leader>k',  group = 'Spectre' },
  { '<leader>kf', ':lua require("spectre").open()<CR>',                          desc = 'open finder' },
  { '<leader>kw', ':lua require("spectre").open_visual({select_word=true})<CR>', desc = 'search selected word' },
  { '<leader>ks', ':require("spectre").open_visual()<CR>',                       desc = 'search word' },
  { '<leader>kb', ':lua require("spectre").open_file_search()<CR>',              desc = 'search in file' },
})

wk.add({
  { '<leader>g',   group = 'Git' },
  { '<leader>gf',  ':Git fetch<CR>',             desc = 'fetch' },
  { '<leader>gk',  ':Git checkout',              desc = 'commit' },
  { '<leader>gp',  ':Git pull<CR>',              desc = 'pull' },
  { '<leader>gr',  ':Git rebase<CR>',            desc = 'rebase' },
  { '<leader>gs',  ':Git d<CR>',                 desc = 'diff view' },
  { '<leader>gS',  ':Git status<CR>',            desc = 'status' },
  { '<leader>gm',  ':GFiles?<CR>',               desc = 'modified files' },
  { '<leader>ga',  ':Git add<CR>',               desc = 'add' },
  { '<leader>gc',  ':Git commit<CR>',            desc = 'commit' },
  { '<leader>gM',  ':Git merge',                 desc = 'merge' },
  { '<leader>gP',  ':Git push<CR>',              desc = 'push' },
  { '<leader>gl',  ':Git log<CR>',               desc = 'log' },
  { '<leader>gb',  ':ToggleBlameLine<CR>',       desc = 'blame' },
  { '<leader>gB',  ':Git blame<CR>',             desc = 'blame' },
  { '<leader>g/',  ':AdvancedGitSearch<CR>',     desc = 'advanced search' },

  { '<leader>gh',  group = 'Hunk' },
  { '<leader>ghp', ':GitGutterPreviewHunk<CR>',  desc = 'preview hunk' },
  { '<leader>ghu', ':GitGutterUndoHunk<CR>',     desc = 'undo hunk' },
  { '<leader>ghs', ':GitGutterStageHunk<CR>',    desc = 'stage hunk' },

  { '<leader>gd',  group = 'Diff' },
  { '<leader>gdf', ':DiffviewFileHistory %<CR>', desc = 'diff view file history' },
  { '<leader>gdc', ':DiffviewClose<CR>',         desc = 'close diff view' },
  { '<leader>gdv', ':Gvdiffsplit<CR>',           desc = 'diff vsplit' },
  { '<leader>gdh', ':Ghdiffsplit<CR>',           desc = 'diff split' },
})


wk.add({
  { '<leader>S',  group = 'Session' },
  { '<leader>Sf', ':Autosession search<CR>', desc = 'search session' },
  { '<leader>Ss', ':SessionSave<CR>',        desc = 'save session' },
  { '<leader>Sl', ':SessionRestore<CR>',     desc = 'load session (PWD)' },
  { '<leader>Sd', ':SessionDelete<CR>',      desc = 'delete session' },
  { '<leader>SD', ':Autosession delete<CR>', desc = 'find to delete session' },
})


wk.add({
  { '<leader>t',  group = 'Terminal' },
  { '<leader>t;', ':FloatermNew --wintype=popup<CR>', desc = 'terminal' },
  { '<leader>tt', ':FloatermToggle<CR>',              desc = 'toggle' },
  { '<leader>tf', ':FloatermNew fzf<CR>',             desc = 'fzf' },
  { '<leader>tg', ':FloatermNew lazygit<CR>',         desc = 'git' },
  { '<leader>td', ':FloatermNew lazydocker<CR>',      desc = 'docker' },
  { '<leader>tj', ':FloatermNew java<CR>',            desc = 'jshell' },
  { '<leader>tn', ':FloatermNew node<CR>',            desc = 'node' },
  { '<leader>tN', ':FloatermNew lazynpm<CR>',         desc = 'lazynpm' },
  { '<leader>tp', ':FloatermNew python<CR>',          desc = 'python' },
  { '<leader>tr', ':FloatermNew ranger<CR>',          desc = 'ranger' },
  { '<leader>th', ':FloatermNew htop<CR>',            desc = 'htop' },
  { '<leader>ty', ':FloatermNew ytop<CR>',            desc = 'ytop' },
})


wk.add({
  { '<leader>m',  group = 'Harpoon' },
  { '<leader>mM', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', desc = 'menu' },
  { '<leader>ma', ':lua require("harpoon.mark").add_file()<CR>',        desc = 'add file' },
  { '<leader>md', ':lua require("harpoon.mark").rm_file()<CR>',         desc = 'remove file' },
  { '<leader>mt', ':lua require("harpoon.mark").toggle_file()<CR>',     desc = 'toggle file' },
  { '<leader>mC', ':lua require("harpoon.mark").clear_all()<CR>',       desc = 'clear all' },
  { '<leader>m1', ':lua require("harpoon.ui").nav_file(1)<CR>',         desc = 'go to 1' },
  { '<leader>m2', ':lua require("harpoon.ui").nav_file(2)<CR>',         desc = 'go to 2' },
  { '<leader>m3', ':lua require("harpoon.ui").nav_file(3)<CR>',         desc = 'go to 3' },
  { '<leader>m4', ':lua require("harpoon.ui").nav_file(4)<CR>',         desc = 'go to 4' },
  { '<leader>m5', ':lua require("harpoon.ui").nav_file(5)<CR>',         desc = 'go to 5' },
  { '<leader>m6', ':lua require("harpoon.ui").nav_file(6)<CR>',         desc = 'go to 6' },
  { '<leader>m7', ':lua require("harpoon.ui").nav_file(7)<CR>',         desc = 'go to 7' },
  { '<leader>m8', ':lua require("harpoon.ui").nav_file(8)<CR>',         desc = 'go to 8' },
  { '<leader>m9', ':lua require("harpoon.ui").nav_file(9)<CR>',         desc = 'go to 9' },
  { '<leader>m0', ':lua require("harpoon.ui").nav_file(0)<CR>',         desc = 'go to 0' },
})

wk.add({
  { '<leader>P',  group = 'Projects' },
  { '<leader>PM', ':CdProject<CR>',     desc = 'Switch to another project' },
  { '<leader>Pa', ':CdProjectAdd<CR>',  desc = 'Added project to list' },
  { '<leader>Pb', ':CdProjectBack<CR>', desc = 'Switch back to previous project' },
})

wk.add({
  { '<leader>z',  group = 'Second Brain' },
  { '<leader>zf', ":lua require('telekasten').find_notes()<CR>",                desc = 'Find notes' },
  { '<leader>zd', ":lua require('telekasten').find_daily_notes()<CR>",          desc = 'Find daily notes' },
  { '<leader>zw', ":lua require('telekasten').find_weekly_notes()<CR>",         desc = 'Find weekly notes' },
  { '<leader>zT', ":lua require('telekasten').goto_today()<CR>",                desc = 'Go to today' },
  { '<leader>zW', ":lua require('telekasten').goto_thisweek()<CR>",             desc = 'Go to week' },
  { '<leader>zt', ":lua require('telekasten').toggle_todo()<CR>",               desc = 'Toggle todo' },
  { '<leader>zm', ":lua require('telekasten').browse_media()<CR>",              desc = 'Browser media' },

  { '<leader>zg', ":lua require('telekasten').search_notes()<CR>",              desc = 'Search notes' },
  { '<leader>zn', ":lua require('telekasten').new_note()<CR>",                  desc = 'New note' },
  { '<leader>zN', ":lua require('telekasten').new_templated_note()<CR>",        desc = 'New template' },

  { '<leader>zz', ":lua require('telekasten').follow_link()<CR>",               desc = 'Follow link' },
  { '<leader>zb', ":lua require('telekasten').show_backlinks()<CR>",            desc = 'Show backlinks' },

  { '<leader>zy', ":lua require('telekasten').yank_notelink()<CR>",             desc = 'Yank note link' },
  -- {'<leader>zI' , ":lua require('telekasten').insert_link({ i=true })<CR>", desc = 'Insert link' },
  { '<leader>zI', ":lua require('telekasten').insert_img_link({ i=true })<CR>", desc = 'Insert img link' },
  { '<leader>zi', ":lua require('telekasten').paste_img_and_link()<CR>",        desc = 'Paste img and link' },
  { '<leader>zp', ":lua require('telekasten').preview_img()<CR>",               desc = 'Preview img' },

  { '<leader>za', ":lua require('telekasten').show_tags()<CR>",                 desc = 'Show tags' },
  { '<leader>z#', ":lua require('telekasten').show_tags()<CR>",                 desc = 'Show tags' },

  { '<leader>zr', ":lua require('telekasten').rename_note()<CR>",               desc = 'Rename note' },
  -- on hesitation, bring up the panel
  { '<leader>zP', ":lua require('telekasten').panel()<CR>",                     desc = 'Show panel' }
})

-- Groups for keymaps defined in others configs and plugins
wk.add({ { '<leader><Space>', group = 'Buf Search' } })
wk.add({ { '<leader>b', group = 'Buffer' } })
wk.add({ { '<leader>l', group = 'Mason' } })
wk.add({ { '<leader>s', group = 'Treesitter Selection' } })
wk.add({ { '<leader>c', group = 'Code' } })
wk.add({ { '<leader>r', group = 'Run Test' } })
wk.add({ { '<leader>h', group = 'Git Hunk' } })

