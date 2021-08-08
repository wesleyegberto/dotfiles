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
paq {'easymotion/vim-easymotion'}

-- mappings to easily delete, change and add such surroundings in {}, (), [], "", ''
paq {'tpope/vim-surround'}

-- autoclose and actions to insert spaces or new line between {}, (), []
paq {'jiangmiao/auto-pairs'}

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

-- better syntax highlighter and more
paq {'nvim-treesitter/nvim-treesitter'}

-- plugin to facilitate the configuration for LSP
paq {'neovim/nvim-lspconfig'}
paq {'kabouzeid/nvim-lspinstall'}
paq {'nvim-lua/completion-nvim'}

-- paq {'mfussenegger/nvim-jdtls'} -- java
paq {'OmniSharp/omnisharp-vim'} -- csharp

paq {'nvim-telescope/telescope.nvim'}
paq {'fhill2/telescope-ultisnips.nvim'}
paq {'ThePrimeagen/refactoring.nvim'}
paq {'camgraff/telescope-tmux.nvim'}
paq {'nvim-telescope/telescope-project.nvim'}

paq {'junegunn/fzf', run = fn['fzf#install']}
paq {'junegunn/fzf.vim'}
paq {'ojroques/nvim-lspfuzzy'}

-- snippet engine
paq {'SirVer/ultisnips'}

paq {'glepnir/galaxyline.nvim'}

-- colorscheme
paq {'morhetz/gruvbox'}
paq {'ryanoasis/vim-devicons'}

-- tree explorer
paq {'kyazdani42/nvim-web-devicons'}
paq {'kyazdani42/nvim-tree.lua'}

paq {'mhinz/vim-startify'}

-- session management
paq {'rmagatti/auto-session'}
paq {'rmagatti/session-lens'}
