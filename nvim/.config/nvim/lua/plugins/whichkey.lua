-- === folke/which-key.nvim ===

local wk = require("which-key")

vim.cmd([[
highlight default link WhichKey          Operator
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyDesc      Operator
]])

-- use the default settings
wk.setup {}

wk.register({
  w = {
    name = 'windows',
    ['w']  = { '<C-w>w'         , 'other-window' },
    ['q']  = { '<C-w>q'         , 'quit window' },
    ['c']  = { '<C-w>q'         , 'quit window' },
    ['d']  = { ':bdelete<CR>'   , 'close buffer' },
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
    ['x']  = { '<C-w>x'         , 'flip windows' },
    ['th'] = { '<C-w>t<C-w>H'   , 'flip horiz-to-vert' },
    ['tk'] = { '<C-w>t<C-w>K'   , 'flip vert-to-horiz' },
    ['?']  = { ':Windows<CR>'   , 'fzf window' },
  },
}, { prefix = "<leader>" })


wk.register({
  s = {
    name = 'search',
    ['/'] = { ':History/<CR>'     , 'history' },
    [';'] = { ':Commands<CR>'     , 'commands' },
    ['b'] = { ':BLines<CR>'       , 'current buffer' },
    ['B'] = { ':Buffers<CR>'      , 'open buffers' },
    ['c'] = { ':Commits<CR>'      , 'commits' },
    ['C'] = { ':BCommits<CR>'     , 'buffer commits' },
    ['f'] = { ':Files<CR>'        , 'files' },
    ['g'] = { ':GFiles<CR>'       , 'git files' },
    ['G'] = { ':GFiles?<CR>'      , 'modified git files' },
    ['h'] = { ':History<CR>'      , 'file history' },
    ['H'] = { ':History:<CR>'     , 'command history' },
    ['l'] = { ':Lines<CR>'        , 'lines' },
    ['m'] = { ':Marks<CR>'        , 'marks' },
    ['M'] = { ':Maps<CR>'         , 'normal maps' },
    ['p'] = { ':Helptags<CR>'     , 'help tags' },
    ['P'] = { ':Tags<CR>'         , 'project tags' },
    ['s'] = { ':Snippets<CR>'     , 'snippets' },
    ['S'] = { ':Colors<CR>'       , 'color schemes' },
    ['t'] = { ':Rg<CR>'           , 'text Rg' },
    ['T'] = { ':BTags<CR>'        , 'buffer tags' },
    ['w'] = { ':Windows<CR>'      , 'search windows' },
    ['y'] = { ':Filetypes<CR>'    , 'file types' },
    ['z'] = { ':FZF<CR>'          , 'FZF' },
  },
}, { prefix = "<leader>" })


wk.register({
  g = {
    name = 'git',
    ['f'] = { ':Gfetch<CR>'       , 'fetch' },
    ['p'] = { ':Gpull<CR>'        , 'pull' },
    ['r'] = { ':Grebase<CR>'      , 'rebase' },
    ['s'] = { ':Gstatus<CR>'      , 'status' },
    ['m'] = { ':GFiles?<CR>'      , 'modified files' },
    ['c'] = { ':Gcommit<CR>'      , 'commit' },
    ['P'] = { ':Gpush<CR>'        , 'push' },
    ['l'] = { ':Glog<CR>'         , 'log' },
    ['b'] = { ':Git blame<CR>'    , 'blame' },
    ['v'] = { ':Gvdiffsplit<CR>'  , 'diff vsplit' },
    ['h'] = { ':Ghdiffsplit<CR>'  , 'diff split' },
  },
}, { prefix = "<leader>" })


wk.register({
  S = {
    name = 'startify',
    ['S'] = { ':Startify<CR>'  , 'start screen' },
    ['s'] = { ':SSave<CR>'     , 'save sessions' },
    ['l'] = { ':SLoad<CR>'     , 'load sessions' },
    ['d'] = { ':SDelete<CR>'   , 'delete sessions' },
    ['c'] = { ':SClose<CR>'    , 'close sessions'},
  },
}, { prefix = "<leader>" })


wk.register({
  f = {
    name = 'Telescope',
    ['f'] = { ':Telescope find_files<CR>'                 , 'Find file' },
    ['b'] = { ':Telescope buffers<CR>'                    , 'Find buffers' },
    ['r'] = { ':Telescope live_grep<CR>'                  , 'Find ripgrep' },
    ['m'] = { ':Telescope marks<CR>'                      , 'Find marks' },
    ['t'] = { ':Telescope tags<CR>'                       , 'Find tags' },
    ['h'] = { ':Telescope help_tags<CR>'                  , 'Find help' },
    ['S'] = { ':Telescope session-lens search_session<CR>', 'Find sessions' }
  },
}, { prefix = "<leader>" })


wk.register({
  F = {
    name = 'FZF',
    ['f'] = { ':Files<CR>'     , 'Find file' },
    ['b'] = { ':Buffers<CR>'   , 'Find buffer' },
    ['r'] = { ':Rg<CR>'        , 'Find file with ripgrep' },
    ['t'] = { ':Tags<CR>'      , 'Find tag' },
    ['m'] = { ':Marks<CR>'     , 'Find mark'},
  },
}, { prefix = "<leader>" })


wk.register({
  t = {
    name = 'terminal',
    [';'] = { ':FloatermNew --wintype=popup --height=10<CR>', 'terminal' },
    ['t'] = { ':FloatermToggle<CR>'                         , 'toggle' },
    ['f'] = { ':FloatermNew fzf<CR>'                        , 'fzf' },
    ['g'] = { ':FloatermNew lazygit<CR>'                    , 'git' },
    ['d'] = { ':FloatermNew lazydocker<CR>'                 , 'docker' },
    ['j'] = { ':FloatermNew java<CR>'                       , 'jshell' },
    ['n'] = { ':FloatermNew node<CR>'                       , 'node' },
    ['N'] = { ':FloatermNew lazynpm<CR>'                    , 'lazynpm' },
    ['p'] = { ':FloatermNew python<CR>'                     , 'python' },
    ['r'] = { ':FloatermNew ranger<CR>'                     , 'ranger' },
    ['h'] = { ':FloatermNew htop<CR>'                       , 'htop' },
    ['y'] = { ':FloatermNew ytop<CR>'                       , 'ytop' },
  },
}, { prefix = "<leader>" })
