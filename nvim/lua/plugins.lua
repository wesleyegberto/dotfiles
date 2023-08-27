vim.cmd 'packadd packer.nvim'

require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}

  -- APIs for Lua (used by many plugins)
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-lua/popup.nvim'}

  -- display keymaps available
  use {'folke/which-key.nvim'}

  use {'glepnir/dashboard-nvim'}
  use {'glepnir/galaxyline.nvim'}

  -- === file navigaton ===
  -- tree explorer
  use {'kyazdani42/nvim-web-devicons'}
  use {'kyazdani42/nvim-tree.lua'}

  use {'voldikss/vim-floaterm'}
  use {'ThePrimeagen/harpoon'}
  -- use {'chentoast/marks.nvim'}
  use {'matbme/JABS.nvim'}

  use {'nvim-telescope/telescope.nvim'}
  use {'nvim-telescope/telescope-fzf-native.nvim'} -- better performance to sor
  use {'nvim-telescope/telescope-ui-select.nvim'}
  use {'nvim-telescope/telescope-project.nvim'}
  use {'axkirillov/easypick.nvim'} -- to create pickers from terminal command

  use {'junegunn/fzf', run = vim.fn['fzf#install']}
  use {'junegunn/fzf.vim'}

  -- === buffer navigation ===
  use {'famiu/bufdelete.nvim'}

  -- jump to any place in the buffer
  use {'phaazon/hop.nvim'}
  -- plugin to facilitate navigation
  use {'tpope/vim-unimpaired'}
  -- plugin to facilitate navigation between surroundings ({}, (), if/endif, so on)
  use {'andymass/vim-matchup'}

  -- === editing ===
  use {'Darazaki/indent-o-matic'} -- detect indentatio
  use {'nvim-pack/nvim-spectre'} -- search/replace
  -- mappings to easily delete, change and add such surroundings in {}, (), [], "", ''
  use {'kylechui/nvim-surround'}
  -- autoclose and actions to insert spaces or new line between {}, (), []
  use {'windwp/nvim-autopairs'}
  -- adds more text objects to be used as targets in motions
  use {'wellle/targets.vim'}
  use {'mg979/vim-visual-multi'} -- sublime-like multiple cursor editor
  use {'ntpeters/vim-better-whitespace'} -- highlight trailing whitespace
  use {'numToStr/Comment.nvim'}

  -- code folding
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  -- === git ===
  use {'tpope/vim-fugitive'}
  use {'airblade/vim-gitgutter'}
  use {'tveskag/nvim-blame-line'}
  use {'sindrets/diffview.nvim'}
  use {'akinsho/git-conflict.nvim'}
  use {'aaronhallaert/advanced-git-search.nvim'}

  -- === LSP ===
  use {'neovim/nvim-lspconfig'} -- plugin to facilitate the configuration for LSP
  use {'jinzhongjia/LspUI.nvim', branch = "legacy"}
  use {'williamboman/mason.nvim'}
  use {'williamboman/mason-lspconfig.nvim'}
  use {'onsails/lspkind-nvim'}
  use {'ray-x/lsp_signature.nvim'} -- method signature
  use {'VidocqH/lsp-lens.nvim'} -- show references
  use {'DNLHC/glance.nvim'} -- window preview
  use {'folke/trouble.nvim'} -- panel for diagnostics
  use {'vim-test/vim-test'} -- run tests
  use {'kevinhwang91/nvim-bqf'} -- improves quick-fix list (float window, search), use `zf` to search
  use {'aznhe21/actions-preview.nvim'}

  use { "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end }

  use {'mfussenegger/nvim-jdtls'} -- java
  use {'mfussenegger/nvim-dap'} -- debugger (https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/)
  use {'jay-babu/mason-nvim-dap.nvim'}
  use {'rcarriga/nvim-dap-ui'} -- UI for debug
  use {'theHamsta/nvim-dap-virtual-text'}
  use {'OmniSharp/omnisharp-vim'} -- csharp (run `:OmniSharpInstall`)
  use {'Hoffs/omnisharp-extended-lsp.nvim'} -- lib decompiler for C#
  use {'jose-elias-alvarez/typescript.nvim'} -- lib decompiler for TS
  use {'windwp/nvim-ts-autotag'} -- auto close tags

  -- better syntax highlighter and more
  use {'nvim-treesitter/nvim-treesitter', run = function() vim.cmd 'TSUpdate' end} -- fix highlight error
  use {'ThePrimeagen/refactoring.nvim'}

  -- === snippet engine ===
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'L3MON4D3/LuaSnip'}
  use {'saadparwaiz1/cmp_luasnip'}
  use {'rafamadriz/friendly-snippets'}
  -- use {'smjonas/snippet-converter.nvim'} -- snippet converter

  -- === tmux ===
  use {'benmills/vimux'} -- tmux integration
  use {'christoomey/vim-tmux-navigator'} -- navigate between open tabs with C-h C-j C-k C-k
  use {'camgraff/telescope-tmux.nvim'} -- search tmux sessions, windows and tabs

  -- === colorscheme ===
  use {'ellisonleao/gruvbox.nvim'}
  use {'luisiacc/gruvbox-baby'}
  use {'Mofiqul/dracula.nvim'}
  use {'navarasu/onedark.nvim'}
  use {'JoosepAlviste/palenightfall.nvim'}
  use {'folke/tokyonight.nvim'}
  use {'ryanoasis/vim-devicons'}

  -- === session management ===
  use {'rmagatti/auto-session'}

  use {'renerocksai/telekasten.nvim'}
  use {'renerocksai/calendar-vim'}
end)
