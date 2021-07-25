-- #########################################################
-- # Appearance
-- #########################################################
vim.cmd('syntax on')

vim.g.gruvbox_italic = 1
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = '0'

-- vim.cmd('colorscheme plain')
vim.o.background = 'dark'
vim.cmd('colorscheme gruvbox')

--- popup colors
vim.cmd('hi Pmenu      ctermbg=Darkgray  guibg=Drakgray  ctermfg=White guifg=White')
vim.cmd('hi PmenuSel   ctermbg=White guibg=White ctermfg=Black guifg=Black')
vim.cmd('hi PmenuThumb ctermbg=Black guibg=Black ctermfg=White guifg=White')


-- #########################################################
-- # General settings
-- #########################################################

vim.cmd('set termguicolors')

-- vim.o.t_Co = '256'                                           -- explicitly tell vim that the terminal supports 256 colors
vim.o.ttyfast = true                                         -- faster redrawing

vim.o.encoding = 'utf-8'

vim.o.backup = false                                         -- some servers have issues with backup files, see #649
vim.o.hidden = true                                          -- to allow switch between buffers without save

vim.o.cmdheight=2                                            -- better display for messages

vim.cmd('set clipboard+=unnamed')
-- vim.o.clipboard = vim.o.clipboard .. 'unnamed'
vim.o.mouse = 'a'                                            -- enable mouse if possible

vim.o.ls = 2                                                 -- always show status bar
vim.wo.number = true
vim.wo.relativenumber = true                                 -- show relative number of lines to the current line
vim.o.cursorline = true                                      -- display a marker on current line
-- vim.o.showmode = false                                       -- airline will do the job
vim.o.showcmd = true                                         -- display incomplete commands
vim.o.showmatch = true                                       -- show matching brackets/parentthesis

-- Whitespace and indentation
vim.wo.wrap = false                                          -- don't wrap lines
vim.o.expandtab = false                                      -- by default not expand tab
vim.o.tabstop = 4                                            -- a tab is two spaces (or vim.o.this to 4)
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.lazyredraw = true                                      -- don't redraw while executing macros
vim.o.smartindent = true

vim.o.backspace = 'indent,eol,start'                         -- allow backspace over everything in isert mode

-- Searching
vim.o.hlsearch = true                                        -- highlight matches
vim.o.incsearch = true                                       -- incremental searching
vim.o.ignorecase = true                                      -- searches are insensitive
vim.o.smartcase = true                                       -- unless they contain at least one capital letter

-- Code folding settings (use `zc`, `zo`, `zz`)
vim.wo.foldenable = false                                    -- don't fold by default
vim.wo.foldmethod = 'marker'
vim.wo.foldmarker = '{,}'
vim.wo.foldlevel = 1
vim.o.foldlevelstart = 99
vim.wo.foldnestmax = 10                                      -- deepest fold is 10 levels

-- Toggle invisible characters
vim.wo.list = true
vim.o.listchars = [[tab:→ ,trail:⋅,extends:❯,precedes:❮,extends:#,nbsp:.]]
vim.o.showbreak = '↪'

-- Autocomplete menu
vim.o.completeopt = 'menuone,longest,preview'                -- simple autocomplete for anything
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

vim.o.updatetime = 1000                                      -- You will have bad experience for diagnostic messages when it's default 4000
vim.o.shortmess = vim.o.shortmess .. 'c'                     -- don't give |ins-completion-menu| messages
vim.o.signcolumn = 'yes'                                     -- always show signcolumns

vim.cmd('filetype plugin indent on')

