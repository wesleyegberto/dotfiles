-- #########################################################
-- # General mappings
-- #########################################################

local map = vim.api.nvim_set_keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

local options = { noremap = true }
local silentOptions = { noremap = true, silent=true }

-- save buffer
map('n', '<C-s>', ':w<CR>', options)
map('i', '<C-s>', '<Esc>:w<CR>a', options)
map('v', '<C-s>', '<Esc>:w<CR>', options)

map('i', 'jj', '<Esc>', options)

map('n', '<Leader><Esc>', ':nohlsearch<CR>', options)

-- flip
map('n', '<Leader>wfv', '<C-w>t<C-w>H', silentOptions) -- change vertical split to horizontal
map('n', '<Leader>wfh', '<C-w>t<C-w>K', silentOptions) -- change horizontal split to vertical

-- buffers navigation
map('n', 'gb', ':bnext<CR>', options)
map('n', 'gB', ':bprev<CR>', options)
map('n', '<M-Right>', ':bn<CR>', silentOptions)
map('n', '<M-Left>', ':bp<CR>', silentOptions)
map('n', '<Leader>bp', ':bprevious<CR>', silentOptions)
map('n', '<Leader>bn', ':bnext<CR>', silentOptions)
map('n', '<Leader>bf', ':bfirst<CR>', silentOptions)
map('n', '<Leader>bl', ':blast<CR>', silentOptions)
map('n', '<Leader>bd', ':bd<CR>', silentOptions)
map('n', '<Leader>bk', ':bw<CR>', silentOptions)

-- to allow navigate a line above and bellow correctly when word wrapping
map('n', 'k', 'gk', options)
map('n', 'j', 'gj', options)

-- move to the start of line
map('n', 'H', '^', options)
-- move to the end of line
map('n', 'L', '$', options)

map('n', 'Y', 'y$', options)

-- redo
map('n', 'U', '<C-r>', options)

-- when searching next/previous word, put it on center and unfold if needed
map('n', 'n', 'nzzzv', silentOptions)
map('n', 'N', 'Nzzzv', silentOptions)
-- when joining lines, keep the cursor in location before the join
map('n', 'J', 'mzJ`z', silentOptions)

-- register with C-g to allow undo break points (instead of whole thing)
map('i', ',', ',<C-g>u', options)
map('i', '.', '.<C-g>u', options)
map('i', '!', '!<C-g>u', options)
map('i', '?', '?<C-g>u', options)
map('i', '{', '{<C-g>u', options)
map('i', '}', '}<C-g>u', options)
map('i', '(', '(<C-g>u', options)
map('i', ')', ')<C-g>u', options)

-- insert lines jumps to jumplist (to be accessed with C-o)
-- map('n', '<expr> j', '(v:count > 5 ? "m\'" . v:count : "") . "j"', options)
-- map('n', '<expr> k', '(v:count > 5 ? "m\'" . v:count : "") . "k"', options)
vim.cmd([[
map('n', '<expr> j', '(v:count > 5 ? "m'" . v:count : "") . "j"', options)
map('n', '<expr> k', '(v:count > 5 ? "m'" . v:count : "") . "k"', options)
]])

-- insert mode shortcut to move the cursor
map('i', '<C-h>', '<Left>', options)
map('i', '<C-j>', '<Down>', options)
map('i', '<C-k>', '<Up>', options)
map('i', '<C-l>', '<Right>', options)
map('i', '<C-a>', '<Home>', options)
map('i', '<C-e>', '<End>', options)

map('c', '<C-h>', '<Left>', options)
map('c', '<C-j>', '<Down>', options)
map('c', '<C-k>', '<Up>', options)
map('c', '<C-l>', '<Right>', options)
map('c', '<C-a>', '<Home>', options)
map('c', '<C-e>', '<End>', options)

-- in macOS: ∆ is <M-j>; ˚ is <M-k>; Ô is <M-J>;  is <M-K>; Ó is <M-H>; Ò is <M-L>
-- if has('osx')
  -- <M-j> and <M-k> to move line up and down
  map('n', '∆', ':m .+1<CR>==', silentOptions)
  map('n', '˚', ':m .-2<CR>==', silentOptions)
  map('i', '∆', '<Esc>:m .+1<CR>==gi', silentOptions)
  map('i', '˚', '<Esc>:m .-2<CR>==gi', silentOptions)
  map('v', '∆', ':m \'>+1<CR>gv=gv', silentOptions)
  map('v', '˚', ':m \'<-2<CR>gv=gv', silentOptions)

  -- Use alt + hjkl to resize windows
  map('n', 'Ô', ':resize -5<CR>', silentOptions)
  map('n', '', ':resize +5<CR>', silentOptions)
  map('n', 'Ó', ':vertical resize -5<CR>', silentOptions)
  map('n', 'Ò', ':vertical resize +5<CR>', silentOptions)

-- else
--   -- <M-j> and <M-k> to move line up and down
--   map('n', '<M-j>', ':m .+1<CR>==', silentOptions)
--   map('n', '<M-k>', ':m .-2<CR>==', silentOptions)
--   map('i', '<M-j>', '<Esc>:m .+1<CR>==gi', silentOptions)
--   map('i', '<M-k>', '<Esc>:m .-2<CR>==gi', silentOptions)
--   map('v', '<M-j>', ':m \'>+1<CR>gv=gv', silentOptions)
--   map('v', '<M-k>', ':m \'<-2<CR>gv=gv', silentOptions)

--   -- Use alt + hjkl to resize windows (Ô is <M-J>;  is <M-K>; Ó is <M-H>; Ò is <M-L>)
--   map('n', '<M-J>', ':resize -5<CR>', silentOptions)
--   map('n', '<M-K>', ':resize +5<CR>', silentOptions)
--   map('n', '<M-H>', ':vertical resize -5<CR>', silentOptions)
--   map('n', '<M-L>', ':vertical resize +5<CR>', silentOptions)
-- endif



-- #########################################################
-- # Plugins configuration
-- #########################################################

-- === tpope/vim-commentary === {{{
map('n', '<Leader>C', ':Commentary<CR>', options)
map('v', '<Leader>C', ':Commentary<CR>', options)
-- }}}


-- === tpope/vim-unimpaired === {{{
map('n', '<M-Up>', '<Plug>unimpairedMoveUp', options)
map('n', '<M-Down>', '<Plug>unimpairedMoveDown', options)
-- }}}


-- === nvim-lua/telescope === {{{
map('n', '<C-p>', ':Telescope find_files<CR>', silentOptions)
-- }}}


-- === matbme/JABS.nvim === {{{
map('n', '<C-b>', ':JABSOpen<CR>', silentOptions)
-- }}}


-- === kyazdani42/nvim-tree.lua === {{{
map('n', '<Leader>e', ':NvimTreeToggle<CR>', silentOptions)
-- }}}
