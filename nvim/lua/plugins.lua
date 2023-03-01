vim.cmd 'packadd paq-nvim'

require('paq') {
  {'savq/paq-nvim'};

  -- APIs for Lua (used by many plugins)
  {'nvim-lua/plenary.nvim'};
  {'nvim-lua/popup.nvim'};

  -- display keymaps available
  {'folke/which-key.nvim'};

  {'glepnir/dashboard-nvim'};
  {'glepnir/galaxyline.nvim'};

  -- === file navigaton ===
  -- tree explorer
  {'kyazdani42/nvim-web-devicons'};
  {'kyazdani42/nvim-tree.lua'};

  {'voldikss/vim-floaterm'};
  {'ThePrimeagen/harpoon'};
  -- {'chentoast/marks.nvim'}
  {'matbme/JABS.nvim'};

  {'nvim-telescope/telescope.nvim'};
  {'nvim-telescope/telescope-fzf-native.nvim'}; -- better performance to sort
  {'nvim-telescope/telescope-ui-select.nvim'};
  {'nvim-telescope/telescope-project.nvim'};
  {'axkirillov/easypick.nvim'}; -- to create pickers from terminal commands

  {'junegunn/fzf', run = vim.fn['fzf#install']};
  {'junegunn/fzf.vim'};

  -- === buffer navigation ===
  {'famiu/bufdelete.nvim'};

  -- jump to any place in the buffer
  {'phaazon/hop.nvim'};
  -- plugin to facilitate navigation
  {'tpope/vim-unimpaired'};

  -- === editing ===

  {'Darazaki/indent-o-matic'}; -- detect indentation
  {'nvim-pack/nvim-spectre'}; -- search/replace
  -- mappings to easily delete, change and add such surroundings in {}, (), [], "", ''
  {'kylechui/nvim-surround'};
  -- autoclose and actions to insert spaces or new line between {}, (), []
  {'windwp/nvim-autopairs'};
  -- adds more text objects to be used as targets in motions
  {'wellle/targets.vim'};
  {'mg979/vim-visual-multi'}; -- sublime-like multiple cursor editor
  {'ntpeters/vim-better-whitespace'}; -- highlight trailing whitespaces
  {'numToStr/Comment.nvim'};

  -- === git ===
  {'tpope/vim-fugitive'};
  {'airblade/vim-gitgutter'};
  {'tveskag/nvim-blame-line'};
  {'sindrets/diffview.nvim'};
  {'akinsho/git-conflict.nvim'};

  -- === LSP ===
  {'neovim/nvim-lspconfig'}; -- plugin to facilitate the configuration for LSP
  {'williamboman/mason.nvim'};
  {'williamboman/mason-lspconfig.nvim'};
  {'onsails/lspkind-nvim'};
  {'DNLHC/glance.nvim'}; -- window preview
  {'folke/trouble.nvim'}; -- panel for diagnostics
  {'vim-test/vim-test'};
  {'kevinhwang91/nvim-bqf'}; -- improves quick-fix list (float window, search), use `zf` to search
  {'gennaro-tedesco/nvim-jqx'}; -- JSON/YML formatter and querier (JqxList and JqxQuery)

  {'mfussenegger/nvim-jdtls'}; -- java
  {'mfussenegger/nvim-dap'}; -- debugger (https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/)
  {'rcarriga/nvim-dap-ui'}; -- UI for debug
  {'theHamsta/nvim-dap-virtual-text'};
  -- {'OmniSharp/omnisharp-vim'}; -- csharp (run `:OmniSharpInstall`)
  {'Hoffs/omnisharp-extended-lsp.nvim'}; -- lib decompiler for C#
  {'jose-elias-alvarez/typescript.nvim'}; -- lib decompiler for TS

  -- better syntax highlighter and more
  {'nvim-treesitter/nvim-treesitter', run = function() vim.cmd 'TSUpdate' end}; -- fix highlight error
  {'ThePrimeagen/refactoring.nvim'};
  -- {'ojroques/nvim-lspfuzzy'}; -- enable use FZF popup in LSP finders

  -- === snippet engine ===
  {'hrsh7th/nvim-cmp'};
  {'hrsh7th/cmp-nvim-lsp'};
  {'hrsh7th/cmp-buffer'};
  {'hrsh7th/cmp-path'};
  {'L3MON4D3/LuaSnip'};
  {'saadparwaiz1/cmp_luasnip'};
  {'rafamadriz/friendly-snippets'};

  -- === tmux ===
  {'benmills/vimux'}; -- tmux integration
  {'christoomey/vim-tmux-navigator'}; -- navigate between open tabs with C-h C-j C-k C-k
  {'camgraff/telescope-tmux.nvim'}; -- search tmux sessions, windows and tabs

  -- === colorscheme ===
  {'ellisonleao/gruvbox.nvim'};
  {'luisiacc/gruvbox-baby'};
  {'Mofiqul/dracula.nvim'};
  {'navarasu/onedark.nvim'};
  {'JoosepAlviste/palenightfall.nvim'};
  {'folke/tokyonight.nvim'};
  {'ryanoasis/vim-devicons'};

  -- === session management ===
  {'rmagatti/auto-session'};
  {'rmagatti/session-lens'};

  {'renerocksai/telekasten.nvim'};
  {'renerocksai/calendar-vim'};
}
