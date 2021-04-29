-- #########################################################
-- # General mappings
-- #########################################################

local map = vim.api.nvim_set_keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

options = { noremap = true }
silentOptions = { noremap = true, silent=true }

map('n', '<C-s>', ':w<CR>', options)
map('i', '<C-s>', '<Esc>:w<CR>a', options)
map('v', '<C-s>', '<Esc>:w<CR>', options)

map('i', 'jj', '<Esc>', options)

map('n', '<Leader><Esc>', ':nohlsearch<CR>', options)

map('n', '<Leader>wfv', '<C-w>t<C-w>H', silentOptions) -- flip vertical split to vertical
map('n', '<Leader>wfh', '<C-w>t<C-w>K', silentOptions) -- flip horizontal split to horizontal

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

-- redo
map('n', 'U', '<C-r>', options)

-- insert mode shortcut
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
