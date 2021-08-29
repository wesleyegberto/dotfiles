local cmd = vim.cmd
local fn = vim.fn

cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq

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
-- autoclose and actions to insert spaces or new line between {}, (), []
paq {'windwp/nvim-autopairs'}
paq {'wellle/targets.vim'}

-- highlight trailing whitespaces
paq {'ntpeters/vim-better-whitespace'}
paq {'tpope/vim-commentary'}

-- sublime-like multiple cursor editor
paq {'terryma/vim-multiple-cursors'}

-- show git stuff and info at line
paq {'tpope/vim-fugitive'}
paq {'airblade/vim-gitgutter'}

-- tmux integration and navigate between open pages with C-h C-j C-k C-k
paq {'benmills/vimux'}
paq {'christoomey/vim-tmux-navigator'}

paq {'voldikss/vim-floaterm'}

paq {'matbme/JABS.nvim'}

-- plugin to facilitate the configuration for LSP
paq {'neovim/nvim-lspconfig'}
paq {'kabouzeid/nvim-lspinstall'}
paq {'onsails/lspkind-nvim'}

-- better syntax highlighter and more
paq {'nvim-treesitter/nvim-treesitter'}
paq {'ThePrimeagen/refactoring.nvim'}

-- paq {'mfussenegger/nvim-jdtls'} -- java
paq {'OmniSharp/omnisharp-vim'} -- csharp

paq {'nvim-telescope/telescope.nvim'}
paq {'nvim-telescope/telescope-fzf-native.nvim'}
paq {'camgraff/telescope-tmux.nvim'}
paq {'fhill2/telescope-ultisnips.nvim'}
paq {'nvim-telescope/telescope-project.nvim'}

paq {'junegunn/fzf', run = fn['fzf#install']}
paq {'junegunn/fzf.vim'}
paq {'ojroques/nvim-lspfuzzy'}

-- snippet engine
paq {'rafamadriz/friendly-snippets'}
paq {'hrsh7th/vim-vsnip'}
paq {'hrsh7th/nvim-compe'}
-- paq {'ms-jpq/coq_nvim'}

paq {'glepnir/galaxyline.nvim'}

-- colorscheme
paq {'morhetz/gruvbox'}
paq {'dracula/vim'}
paq {'joshdick/onedark.vim'}
paq {'kaicataldo/material.vim'}
paq {'KeitaNakamura/neodark.vim'}
paq {'ryanoasis/vim-devicons'}

-- tree explorer
paq {'kyazdani42/nvim-tree.lua'}
paq {'kyazdani42/nvim-web-devicons'}

paq {'glepnir/dashboard-nvim'}

-- session management
paq {'rmagatti/auto-session'}
paq {'rmagatti/session-lens'}
