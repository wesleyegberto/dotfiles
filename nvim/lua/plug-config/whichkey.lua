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
    name = 'windows',
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
    ['f'] = { ':Telescope find_files<CR>'                 , 'File' },
    ['F'] = { ':Telescope git_files<CR>'                  , 'Git files' },
    ['e'] = { ':Telescope file_browser<CR>'               , 'File explorer' },
    ['g'] = { ':Telescope git_status<CR>'                 , 'Modifiled git files' },
    ['b'] = { ':Telescope buffers<CR>'                    , 'Buffers' },
    ['L'] = { ':Telescope current_buffer_fuzzy_find<CR>'  , 'Buffer line' },
    ['c'] = { ':Telescope git_commits<CR>'                , 'Commit' },
    ['C'] = { ':Telescope git_bcommits<CR>'               , 'Buffer commit' },
    ['m'] = { ':Telescope marks<CR>'                      , 'Marks' },
    ['t'] = { ':Telescope tags<CR>'                       , 'Tags' },
    ['T'] = { ':Telescope current_buffer_tags<CR>'        , 'Buffer tags' },
    ['r'] = { ':Telescope live_grep<CR>'                  , 'With rg' },
    ['s'] = { ':Telescope ultisnips<CR>'                  , 'Snippets' },
    ['S'] = { ':Telescope session-lens search_session<CR>', 'Sessions' },
    ['X'] = { ':Telescope tmux sessions<CR>'              , 'Tmux sessions' },
    ['/'] = { ':Telescope search_history<CR>'             , 'Commands' },
    ['?'] = { ':Telescope help_tags<CR>'                  , 'Help' },
    ['P'] = { [[:lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>]], 'Find projects' },
  },
}, { prefix = "<leader>" })


wk.register({
  g = {
    name = 'git',
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
    ['f'] = { ':SearchSession<CR>' , 'load sessions' },
    ['s'] = { ':SessionSave<CR>'   , 'save sessions' },
    ['l'] = { ':SessionLoad<CR>'   , 'load sessions' },
  },
}, { prefix = "<leader>" })


wk.register({
  t = {
    name = 'terminal',
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
    ['a'] = { ':lua require("harpoon.mark").add_file()<CR>'       , 'add file' },
    ['d'] = { ':lua require("harpoon.mark").rm_file()<CR>'        , 'remove file' },
    ['t'] = { ':lua require("harpoon.mark").toggle_file()<CR>'    , 'toggle file' },
    ['M'] = { ':lua require("harpoon.ui").toggle_quick_menu()<CR>', 'menu' },
    ['C'] = { ':lua require("harpoon.mark").clear_all()<CR>'      , 'toggle file' },
    ['1'] = { ':lua require("harpoon.ui").nav_file(1)<CR>'        , 'toggle file' },
    ['2'] = { ':lua require("harpoon.ui").nav_file(2)<CR>'        , 'toggle file' },
    ['3'] = { ':lua require("harpoon.ui").nav_file(3)<CR>'        , 'toggle file' },
    ['4'] = { ':lua require("harpoon.ui").nav_file(4)<CR>'        , 'toggle file' },
    ['5'] = { ':lua require("harpoon.ui").nav_file(5)<CR>'        , 'toggle file' },
    ['6'] = { ':lua require("harpoon.ui").nav_file(6)<CR>'        , 'toggle file' },
    ['7'] = { ':lua require("harpoon.ui").nav_file(7)<CR>'        , 'toggle file' },
    ['8'] = { ':lua require("harpoon.ui").nav_file(8)<CR>'        , 'toggle file' },
    ['9'] = { ':lua require("harpoon.ui").nav_file(9)<CR>'        , 'toggle file' },
    ['0'] = { ':lua require("harpoon.ui").nav_file(0)<CR>'        , 'toggle file' },
  },
}, { prefix = "<leader>" })
