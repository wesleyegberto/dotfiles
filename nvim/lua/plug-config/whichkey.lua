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
  plugins = {
    marks = false, -- shows a list of your marks on ' and `
    presets = {
      operators = false, -- adds help for operators like d, y, ...
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 2, -- spacing between columns
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto",
  triggers = "<leader>"
}

wk.register({
  w = {
    name = 'Windows',
    ['w']  = { '<C-w>w'         , 'other-window' },
    ['q']  = { '<C-w>q'         , 'quit window' },
    ['d']  = { ':Bdelete<CR>'   , 'close buffer' },
    ['c']  = { ':Bwipeout<CR>'  , 'wipeout buffer' },
    ['-']  = { '<C-w>s'         , 'split window below' },
    ['|']  = { '<C-w>v'         , 'split window right' },
    ['2']  = { '<C-w>v'         , 'layout double columns' },
    ['h']  = { '<C-w>h'         , 'window left' },
    ['j']  = { '<C-w>j'         , 'window below' },
    ['l']  = { '<C-w>l'         , 'window right' },
    ['k']  = { '<C-w>k'         , 'window up' },
    ['H']  = { '<C-w>5<'        , 'expand window left' },
    ['J']  = { ':resize -5<CR>' , 'expand window below' },
    ['L']  = { '<C-w>5>'        , 'expand window right' },
    ['K']  = { ':resize +5<CR>' , 'expand window up' },
    ['=']  = { '<C-w>='         , 'balance window' },
    ['s']  = { '<C-w>s'         , 'split window below' },
    ['v']  = { '<C-w>v'         , 'split window aside' },
    ['x']  = { '<C-w>f'         , 'flip windows' },
    ['th'] = { '<C-w>t<C-w>H'   , 'flip horiz-to-vert' },
    ['tk'] = { '<C-w>t<C-w>K'   , 'flip vert-to-horiz' },
    ['?']  = { ':Windows<CR>'   , 'fzf window' },
  },
}, { prefix = "<leader>" })


wk.register({
  f = {
    name = 'Telescope',
    ['_'] = { ':Telescope<CR>'                            , 'Open Telescope' },
    [';'] = { ':Telescope commands<CR>'                   , 'Commands' },
    ['w'] = { ':Windows<CR>'                              , 'Windows' },
    ['f'] = { ':Telescope find_files<CR>'                 , 'File' },
    ['b'] = { ':Telescope buffers<CR>'                    , 'Buffers' },
    ['L'] = { ':Telescope current_buffer_fuzzy_find<CR>'  , 'Buffer line' },
    ['gs'] = { ':Telescope git_status<CR>'                , 'Modifiled git files' },
    ['gf'] = { ':Telescope git_files<CR>'                 , 'Git files' },
    ['gm'] = { ':Easypick conflicts<CR>'                  , 'Git conflicts' },
    ['gc'] = { ':Telescope git_commits<CR>'               , 'Commit' },
    ['gC'] = { ':Telescope git_bcommits<CR>'              , 'Buffer commit' },
    ['m'] = { ':Telescope marks<CR>'                      , 'Marks' },
    ['t'] = { ':Telescope tags<CR>'                       , 'Tags' },
    ['T'] = { ':Telescope current_buffer_tags<CR>'        , 'Buffer tags' },
    ['r'] = { ':Telescope live_grep<CR>'                  , 'With rg' },
    ['S'] = { ':Telescope session-lens search_session<CR>', 'Sessions' },
    ['X'] = { ':Telescope tmux sessions<CR>'              , 'Tmux sessions' },
    ['/'] = { ':Telescope search_history<CR>'             , 'Commands' },
    ['?'] = { ':Telescope help_tags<CR>'                  , 'Help' },
    ['P'] = { [[:lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>]], 'Find projects' },
  },
}, { prefix = "<leader>" })


wk.register({
  g = {
    name = 'Git',
    ['f'] = { ':Git fetch<CR>'             , 'fetch' },
    ['k'] = { ':Git checkout'              , 'commit' },
    ['p'] = { ':Git pull<CR>'              , 'pull' },
    ['r'] = { ':Git rebase<CR>'            , 'rebase' },
    ['s'] = { ':Git d<CR>'                 , 'diff view' },
    ['S'] = { ':Git status<CR>'            , 'status' },
    ['m'] = { ':GFiles?<CR>'               , 'modified files' },
    ['a'] = { ':Git add<CR>'               , 'add' },
    ['c'] = { ':Git commit<CR>'            , 'commit' },
    ['M'] = { ':Git merge'                 , 'merge' },
    ['P'] = { ':Git push<CR>'              , 'push' },
    ['l'] = { ':Git log<CR>'               , 'log' },
    ['b'] = { ':ToggleBlameLine<CR>'       , 'blame' },
    ['B'] = { ':Git blame<CR>'             , 'blame' },
    ['df'] = { ':DiffviewFileHistory %<CR>', 'diff view file history' },
    ['dc'] = { ':DiffviewClose<CR>'        , 'close diff view' },
    ['v'] = { ':Gvdiffsplit<CR>'           , 'diff vsplit' },
    ['h'] = { ':Ghdiffsplit<CR>'           , 'diff split' },
  },
}, { prefix = "<leader>" })


wk.register({
  S = {
    name = 'Dashboard',
    [';'] = { ':Dashboard<CR>'     , 'start screen' },
    ['f'] = { ':SearchSession<CR>' , 'search session' },
    ['a'] = { ':Autosession<CR>'   , 'auto session' },
    ['s'] = { ':SaveSession<CR>'   , 'save session' },
    ['l'] = { ':RestoreSession<CR>', 'load session (PWD)' },
  },
}, { prefix = "<leader>" })


wk.register({
  t = {
    name = 'Terminal',
    [';'] = { ':FloatermNew --wintype=popup<CR>', 'terminal' },
    ['t'] = { ':FloatermToggle<CR>'             , 'toggle' },
    ['f'] = { ':FloatermNew fzf<CR>'            , 'fzf' },
    ['g'] = { ':FloatermNew lazygit<CR>'        , 'git' },
    ['d'] = { ':FloatermNew lazydocker<CR>'     , 'docker' },
    ['j'] = { ':FloatermNew java<CR>'           , 'jshell' },
    ['n'] = { ':FloatermNew node<CR>'           , 'node' },
    ['N'] = { ':FloatermNew lazynpm<CR>'        , 'lazynpm' },
    ['p'] = { ':FloatermNew python<CR>'         , 'python' },
    ['r'] = { ':FloatermNew ranger<CR>'         , 'ranger' },
    ['h'] = { ':FloatermNew htop<CR>'           , 'htop' },
    ['y'] = { ':FloatermNew ytop<CR>'           , 'ytop' },
  },
}, { prefix = "<leader>" })


wk.register({
  m = {
    name = 'Harpoon',
    ['M'] = { ':lua require("harpoon.ui").toggle_quick_menu()<CR>', 'menu' },
    ['a'] = { ':lua require("harpoon.mark").add_file()<CR>'       , 'add file' },
    ['d'] = { ':lua require("harpoon.mark").rm_file()<CR>'        , 'remove file' },
    ['t'] = { ':lua require("harpoon.mark").toggle_file()<CR>'    , 'toggle file' },
    ['C'] = { ':lua require("harpoon.mark").clear_all()<CR>'      , 'clear all' },
    ['1'] = { ':lua require("harpoon.ui").nav_file(1)<CR>'        , 'go to 1' },
    ['2'] = { ':lua require("harpoon.ui").nav_file(2)<CR>'        , 'go to 2' },
    ['3'] = { ':lua require("harpoon.ui").nav_file(3)<CR>'        , 'go to 3' },
    ['4'] = { ':lua require("harpoon.ui").nav_file(4)<CR>'        , 'go to 4' },
    ['5'] = { ':lua require("harpoon.ui").nav_file(5)<CR>'        , 'go to 5' },
    ['6'] = { ':lua require("harpoon.ui").nav_file(6)<CR>'        , 'go to 6' },
    ['7'] = { ':lua require("harpoon.ui").nav_file(7)<CR>'        , 'go to 7' },
    ['8'] = { ':lua require("harpoon.ui").nav_file(8)<CR>'        , 'go to 8' },
    ['9'] = { ':lua require("harpoon.ui").nav_file(9)<CR>'        , 'go to 9' },
    ['0'] = { ':lua require("harpoon.ui").nav_file(0)<CR>'        , 'go to 0' },
  },
}, { prefix = "<leader>" })



wk.register({
  z = {
    name = 'Second Brain',
    ['f'] = { ":lua require('telekasten').find_notes()<CR>", 'Find notes' },
    ['d'] = { ":lua require('telekasten').find_daily_notes()<CR>", 'Find daily notes' },
    ['w'] = { ":lua require('telekasten').find_weekly_notes()<CR>", 'Find weekly notes' },
    ['T'] = { ":lua require('telekasten').goto_today()<CR>", 'Go to today' },
    ['W'] = { ":lua require('telekasten').goto_thisweek()<CR>", 'Go to week' },
    ['t'] = { ":lua require('telekasten').toggle_todo()<CR>", 'Toggle todo' },

    ['g'] = { ":lua require('telekasten').search_notes()<CR>", 'Search notes' },
    ['n'] = { ":lua require('telekasten').new_note()<CR>", 'New note' },
    ['N'] = { ":lua require('telekasten').new_templated_note()<CR>", 'New template' },

    ['z'] = { ":lua require('telekasten').follow_link()<CR>", 'Follow link' },
    ['b'] = { ":lua require('telekasten').show_backlinks()<CR>", 'Show backlinks' },

    ['y'] = { ":lua require('telekasten').yank_notelink()<CR>", 'Yank note link' },
    ['I'] = { ":lua require('telekasten').insert_link({ i=true })<CR>", 'Insert link' },
    ['I'] = { ":lua require('telekasten').insert_img_link({ i=true })<CR>", 'Insert img link' },
    ['i'] = { ":lua require('telekasten').paste_img_and_link()<CR>", 'Paste img and link' },
    ['p'] = { ":lua require('telekasten').preview_img()<CR>", 'Preview img' },

    ['m'] = { ":lua require('telekasten').browse_media()<CR>", 'Browser media' },
    ['a'] = { ":lua require('telekasten').show_tags()<CR>", 'Show tags' },
    ['#'] = {  ":lua require('telekasten').show_tags()<CR>", 'Show tags' },

    ['c'] = { ":lua require('telekasten').show_calendar()<CR>", 'Show calendar' },
    ['C'] = { ":CalendarT<CR>", 'Show fullscreen calendar' },
    ['r'] = { ":lua require('telekasten').rename_note()<CR>", 'Rename note' },
    -- on hesitation, bring up the panel
    ['r'] = { ":lua require('telekasten').panel()<CR>", 'Show panel' },
  }
}, { prefix = "<leader>"})


