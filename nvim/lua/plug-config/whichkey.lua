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
    ['/'] = { ':History/<CR>'     , 'search history' },
    [';'] = { ':Commands<CR>'     , 'commands' },
    ['b'] = { ':Buffers<CR>'      , 'open buffers' },
    ['c'] = { ':Commits<CR>'      , 'commits' },
    ['C'] = { ':BCommits<CR>'     , 'buffer commits' },
    ['f'] = { ':Files<CR>'        , 'files' },
    ['F'] = { ':GFiles<CR>'       , 'git files' },
    ['g'] = { ':GFiles?<CR>'      , 'modified git files' },
    ['h'] = { ':History<CR>'      , 'file history' },
    ['H'] = { ':History:<CR>'     , 'command history' },
    ['l'] = { ':BLines<CR>'       , 'line in current buffer' },
    ['L'] = { ':Lines<CR>'        , 'line in project' },
    ['m'] = { ':Marks<CR>'        , 'marks' },
    ['M'] = { ':Maps<CR>'         , 'normal maps' },
    ['p'] = { ':Helptags<CR>'     , 'help tags' },
    ['r'] = { ':Rg<CR>'           , 'text Rg' },
    ['s'] = { ':Snippets<CR>'     , 'snippets' },
    ['S'] = { ':Colors<CR>'       , 'color schemes' },
    ['t'] = { ':Tags<CR>'         , 'project tags' },
    ['T'] = { ':BTags<CR>'        , 'buffer tags' },
    ['w'] = { ':Windows<CR>'      , 'search windows' },
    ['y'] = { ':Filetypes<CR>'    , 'file types' },
    ['z'] = { ':FZF<CR>'          , 'FZF' },
  },
}, { prefix = "<leader>" })


wk.register({
  f = {
    name = 'Telescope',
    ['_'] = { ':Telescope<CR>'                            , 'Open Telescope' },
    ['f'] = { ':Telescope find_files<CR>'                 , 'Find file' },
    ['b'] = { ':Telescope buffers<CR>'                    , 'Find buffers' },
    ['c'] = { ':Telescope git_commits<CR>'                , 'Find commit' },
    ['C'] = { ':Telescope git_bcommits<CR>'               , 'Find buffer commit' },
    ['r'] = { ':Telescope live_grep<CR>'                  , 'Find with rg' },
    ['m'] = { ':Telescope marks<CR>'                      , 'Find marks' },
    ['L'] = { ':Telescope current_buffer_fuzzy_find<CR>'  , 'Find buffer line' },
    ['t'] = { ':Telescope tags<CR>'                       , 'Find tags' },
    ['T'] = { ':Telescope current_buffer_tags<CR>'        , 'Find buffer tags' },
    ['h'] = { ':Telescope help_tags<CR>'                  , 'Find help' },
    ['s'] = { ':Telescope ultisnips<CR>'                  , 'Find snippets' },
    ['S'] = { ':Telescope session-lens search_session<CR>', 'Find sessions' },
    ['x'] = { ':Telescope commands<CR>'                   , 'Find commands' },
    ['X'] = { ':Telescope tmux sessions<CR>'              , 'Find tmux sessions' },
    ['P'] = { [[:lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>]], 'Find projects' }
  },
}, { prefix = "<leader>" })


wk.register({
  F = {
    name = 'FZF',
    ['b'] = { ':Buffers<CR>'   , 'Find buffer' },
    ['r'] = { ':Rg<CR>'        , 'Find file with ripgrep' },
    ['t'] = { ':Tags<CR>'      , 'Find tag' },
    ['m'] = { ':Marks<CR>'     , 'Find mark'},
  },
}, { prefix = "<leader>" })


wk.register({
  g = {
    name = 'git',
    ['f'] = { ':Git fetch<CR>'    , 'fetch' },
    ['k'] = { ':Git checkout'     , 'commit' },
    ['p'] = { ':Git pull<CR>'     , 'pull' },
    ['r'] = { ':Git rebase<CR>'   , 'rebase' },
    ['s'] = { ':Git status<CR>'   , 'status' },
    ['m'] = { ':GFiles?<CR>'      , 'modified files' },
    ['c'] = { ':Git commit<CR>'   , 'commit' },
    ['M'] = { ':Git merge'        , 'merge' },
    ['P'] = { ':Git push<CR>'     , 'push' },
    ['l'] = { ':Git log<CR>'      , 'log' },
    ['b'] = { ':Git blame<CR>'    , 'blame' },
    ['d'] = { ':Git d<CR>'        , 'diff view' },
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