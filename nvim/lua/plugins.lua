local cmd = vim.cmd
local fn = vim.fn

cmd 'packadd paq-nvim'
local paq = require('paq').paq

paq {'savq/paq-nvim', opt = true}

-- APIs for Lua (used by many plugins)
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-lua/popup.nvim'}

-- display which keybindings is available
paq {'folke/which-key.nvim'}

-- plugin to facilitate navigation
paq {'tpope/vim-unimpaired'}
paq {'phaazon/hop.nvim'}

-- mappings to easily delete, change and add such surroundings in {}, (), [], "", ''
paq {'tpope/vim-surround'}
-- paq {'kylechui/nvim-surround'}
-- autoclose and actions to insert spaces or new line between {}, (), []
paq {'windwp/nvim-autopairs'}
-- adds more text objects to be used as targets in motions
paq {'wellle/targets.vim'}

-- highlight trailing whitespaces
paq {'ntpeters/vim-better-whitespace'}
paq {'numToStr/Comment.nvim'}

-- sublime-like multiple cursor editor
paq {'mg979/vim-visual-multi'}

-- show git stuff and info at line
paq {'tpope/vim-fugitive'}
paq {'airblade/vim-gitgutter'}
paq {'tveskag/nvim-blame-line'}
paq {'sindrets/diffview.nvim'}
paq {'akinsho/git-conflict.nvim'}

-- tmux integration and navigate between open pages with C-h C-j C-k C-k
paq {'benmills/vimux'}
paq {'christoomey/vim-tmux-navigator'}

paq {'voldikss/vim-floaterm'}

paq {'ThePrimeagen/harpoon'}
paq {'matbme/JABS.nvim'}
paq {'kevinhwang91/nvim-bqf'} -- improves quick-fix list

-- plugin to facilitate the configuration for LSP
paq {'neovim/nvim-lspconfig'}
paq {'onsails/lspkind-nvim'}
paq {'williamboman/mason.nvim'}
paq {'williamboman/mason-lspconfig.nvim'}
paq {'folke/trouble.nvim'}                  -- panel for diagnostics

-- better syntax highlighter and more
paq {'nvim-treesitter/nvim-treesitter'} -- fix highlight error: `:TSUpdate`
paq {'ThePrimeagen/refactoring.nvim'}

-- paq {'mfussenegger/nvim-jdtls'} -- java
paq {'OmniSharp/omnisharp-vim'} -- csharp

paq {'nvim-telescope/telescope.nvim'}
paq {'nvim-telescope/telescope-fzf-native.nvim'} -- better performance to sort
paq {'nvim-telescope/telescope-ui-select.nvim'}
paq {'camgraff/telescope-tmux.nvim'}
paq {'fhill2/telescope-ultisnips.nvim'}
paq {'nvim-telescope/telescope-project.nvim'}
paq {'nvim-telescope/telescope-file-browser.nvim'}
paq {'axkirillov/easypick.nvim'}

paq {'junegunn/fzf', run = fn['fzf#install']}
paq {'junegunn/fzf.vim'}
paq {'ojroques/nvim-lspfuzzy'}

-- snippet engine
paq {'hrsh7th/nvim-cmp'}
paq {'hrsh7th/cmp-nvim-lsp'}
paq {'hrsh7th/cmp-buffer'}
paq {'hrsh7th/cmp-path'}
paq {'L3MON4D3/LuaSnip'}
paq {'saadparwaiz1/cmp_luasnip'}
paq {'rafamadriz/friendly-snippets'}

paq {'glepnir/galaxyline.nvim'}

-- colorscheme
-- paq {'norcalli/nvim-colorizer.lua'}
-- paq {'morhetz/gruvbox'}
paq {'ellisonleao/gruvbox.nvim'}
paq {'luisiacc/gruvbox-baby'}
paq {'Mofiqul/dracula.nvim'}
paq {'navarasu/onedark.nvim'}
paq {'JoosepAlviste/palenightfall.nvim'}
paq {'folke/tokyonight.nvim'}
paq {'ryanoasis/vim-devicons'}

-- tree explorer
paq {'kyazdani42/nvim-web-devicons'}
paq {'kyazdani42/nvim-tree.lua'}

paq {'famiu/bufdelete.nvim'}
paq {'glepnir/dashboard-nvim'}

-- session management
paq {'rmagatti/auto-session'}
paq {'rmagatti/session-lens'}

paq {'renerocksai/telekasten.nvim'}
paq {'renerocksai/calendar-vim'}

