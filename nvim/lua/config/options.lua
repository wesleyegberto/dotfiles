local cmd = vim.cmd
local u = require('custom/utils')

-- #########################################################
-- # General settings
-- #########################################################

vim.o.termguicolors = true

-- vim.o.t_Co = '256'                                        -- explicitly tell vim that the terminal supports 256 colors
vim.o.ttyfast = true                                         -- faster redrawing

vim.o.encoding = 'utf-8'

vim.o.backup = false                                         -- some servers have issues with backup files, see #649
vim.o.hidden = true                                          -- to allow switch between buffers without save

-- Split the window and put to right/below
vim.o.splitright=true
vim.o.splitbelow=tru

vim.o.cmdheight=1                                            -- better display for messages

vim.o.clipboard = vim.o.clipboard .. 'unnamed'
vim.o.mouse = 'a'                                            -- enable mouse if possible

vim.o.ls = 2                                                 -- always show status bar
vim.wo.number = true
vim.wo.relativenumber = true                                 -- show relative number of lines to the current line
vim.o.cursorline = true                                      -- display a marker on current line
-- vim.o.showmode = false                                    -- airline will do the job
vim.o.showcmd = true                                         -- display incomplete commands
vim.o.showmatch = true                                       -- show matching brackets/parentthesis
vim.opt.colorcolumn = "120"

-- Whitespace and indentation
vim.wo.wrap = false                                          -- don't wrap lines
vim.o.expandtab = false                                      -- by default not expand tab
vim.o.tabstop = 4                                            -- a tab is two spaces (or vim.o.this to 4)
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.shiftround = true                                      -- round wrong identation to shiftwidth
vim.o.lazyredraw = true                                      -- don't redraw while executing macros
vim.o.smartindent = true

vim.o.backspace = 'indent,eol,start'                         -- allow backspace over everything in isert mode

-- Searching
vim.o.hlsearch = true                                        -- highlight matches
vim.o.incsearch = true                                       -- incremental searching
vim.o.ignorecase = true                                      -- searches are insensitive
vim.o.smartcase = true                                       -- unless they contain at least one capital letter

-- Code folding settings (use `zc`, `zo`, `zz`)
-- vim.wo.foldmethod = 'marker'
-- vim.wo.foldmarker = '{,}'
vim.o.foldlevel = 1
vim.o.foldlevelstart = 99
vim.o.foldnestmax = 10                                      -- deepest fold is 10 levels
vim.o.foldenable = true                                     -- don't fold by default

-- Toggle invisible characters
vim.wo.list = true
vim.opt.listchars = {
  space = '⋅',
  trail = '⋅',
  nbsp = '⋅',
  extends = '❯',
  precedes = '❮',
  tab = '→ ',
  -- eol = '⤶',
}
vim.o.showbreak = '↪'

-- Scroll
vim.opt.scrolloff = 3

-- Autocomplete menu
-- vim.o.completeopt = 'menuone,longest,preview'                -- simple autocomplete for anything
vim.o.completeopt = 'menuone,noselect'                -- simple autocomplete for anything
vim.o.previewheight = 5                                      -- preview window height for viewing documentation
vim.o.wildmenu = true                                        -- default true
vim.o.wildmode = 'list:longest,full'                         -- autocomplete for paths and files
vim.o.wildoptions = 'pum,tagfile'                            -- display popup
-- vim.o.pumblend = 0                                        -- transparence
-- ignore these extensions on autocomplete
vim.o.wildignore = vim.o.wildignore .. '*swp,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip,.git,.DS_Store'
vim.o.wildignore = vim.o.wildignore .. '*/tmp/*,*.o,*.obj,*.so'

-- Highlight the content to replace before doing it without spliting
-- vim.o.inccommand = 'nosplit'
-- vim.o.winborder = 'rounded'

-- You will likely want to reduce updatetime which affects CursorHold (note: this setting is global and should be set only once)
vim.o.updatetime = 1000                                      -- You will have bad experience for diagnostic messages when it's default 4000
vim.o.shortmess = vim.o.shortmess .. 'c'                     -- don't give |ins-completion-menu| messages
vim.o.signcolumn = 'yes'                                     -- always show signcolumns

vim.cmd [[
set diffopt+=linematch:60
]]

vim.opt.titlestring = '%{expand("%:P")}'
vim.opt.title = true

-- #########################################################
-- # Custom configuration
-- #########################################################

-- builtin highlight yanked content
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- === translated from jeffkreeftmeijer/vim-numbertoggle === {{{
-- hybrid mode (normal mode: relative, insert mode: absolute)
u.create_augroup('numbertoggle', {
    { 'BufEnter,FocusGained,InsertLeave,WinEnter', '*', 'if &nu | set rnu | endif' },
    { 'BufLeave,FocusLost,InsertEnter,WinLeave', '*', 'if &nu | set nornu | endif' }
})
-- }}}

-- === ntpeters/vim-better-whitespace === {{{
vim.cmd[[
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
]]
-- }}}


vim.cmd [[
filetype plugin indent on

" autocmd BufRead,BufEnter * let &titlestring = expand("%:P")
autocmd BufNewFile,BufRead *.cs set ft=csharp
autocmd BufNewFile,BufRead *.cshtml set ft=html
]]

