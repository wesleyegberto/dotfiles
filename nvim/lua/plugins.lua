vim.cmd 'packadd packer.nvim'

require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}

  -- APIs for Lua (used by many plugins)
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-lua/popup.nvim'}

  -- display keymaps available
  use {'folke/which-key.nvim'}

  use {'DanWlker/toolbox.nvim'}

  -- === file navigaton ===
  -- tree explorer
  use {'nvim-tree/nvim-web-devicons'}
  use {'nvim-tree/nvim-tree.lua'}

  use {'voldikss/vim-floaterm'}
  use {'ThePrimeagen/harpoon', branch = 'harpoon2'}
  use {'matbme/JABS.nvim'}

  use {'nvim-telescope/telescope.nvim'}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- better performance to search
  use {'nvim-telescope/telescope-ui-select.nvim'}
  use {'axkirillov/easypick.nvim'} -- to create pickers from terminal command

  use {'LintaoAmons/cd-project.nvim'}

  use {'junegunn/fzf', run = vim.fn['fzf#install']}
  use {'junegunn/fzf.vim'}

  -- === buffer navigation ===
  use {'famiu/bufdelete.nvim'}
  use {'glepnir/galaxyline.nvim'}

  -- jump to any place in the buffer
  use {'phaazon/hop.nvim'}
  -- plugin to facilitate % navigation between surroundings ({}, (), if/endif, so on)
  use {'andymass/vim-matchup'}

  -- === editing ===
  use {'Darazaki/indent-o-matic'} -- detect indentation
  use {'nvim-pack/nvim-spectre'} -- search/replace
  -- mappings to easily delete, change and add such surroundings in {}, (), [], "", ''
  use {'kylechui/nvim-surround'}
  -- mappings for better editing and navigation with (), [], {}, "", '', functions, args so on
  use {'echasnovski/mini.ai'}
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
  use {'j-hui/fidget.nvim'} -- LSP notifications
  use {'neovim/nvim-lspconfig'} -- plugin to facilitate the configuration for LSP
  use {'jinzhongjia/LspUI.nvim'}
  use {'williamboman/mason.nvim'}
  use {'williamboman/mason-lspconfig.nvim'}
  use {'onsails/lspkind-nvim'}
  use {'ray-x/lsp_signature.nvim'} -- method signature
  use {'VidocqH/lsp-lens.nvim'} -- show references
  use {'hasansujon786/nvim-navbuddy', requires = { 'SmiteshP/nvim-navic', 'MunifTanjim/nui.nvim' } } -- document members popup
  use {'DNLHC/glance.nvim'} -- window preview
  use {'folke/trouble.nvim'} -- panel for diagnostics
  use {'artemave/workspace-diagnostics.nvim'}
  use {'vim-test/vim-test'} -- run tests
  use {'kevinhwang91/nvim-bqf'} -- improves quick-fix list (float window, search), use `zf` to search
  use {'aznhe21/actions-preview.nvim'}

  use { "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end }

  -- === AI ===
  -- use {'github/copilot.vim'}
  -- use {'CopilotC-Nvim/CopilotChat.nvim'}
  -- alternative plugin for copilot
  -- use {'zbirenbaum/copilot.lua'} -- copilot core
  -- use {'zbirenbaum/copilot-cmp'} -- copilot completion

  -- use {'NickvanDyke/opencode.nvim'} -- opencode integration

  use {'augmentcode/augment.vim'}

  -- use {'yetone/avante.nvim'} -- Claude

  -- debugging
  use {'mfussenegger/nvim-dap'} -- debugger (https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/)
  use {'jay-babu/mason-nvim-dap.nvim'}
  use {'rcarriga/nvim-dap-ui'} -- UI for debug
  use {'nvim-neotest/nvim-nio'}
  use {'theHamsta/nvim-dap-virtual-text'}
  -- java
  -- use {'nvim-java/nvim-java'}
  use {'mfussenegger/nvim-jdtls'} -- java
  -- csharp
  use {'OmniSharp/omnisharp-vim'} -- csharp (run `:OmniSharpInstall`)
  use {'Hoffs/omnisharp-extended-lsp.nvim'} -- lib decompiler for C#
  use {'GustavEikaas/easy-dotnet.nvim'}

  use {'windwp/nvim-ts-autotag'} -- auto close tags

  -- better syntax highlighter, textobjects and navigation using treesitter
  use {'nvim-treesitter/nvim-treesitter', run = function() vim.cmd ':TSUpdate' end} -- fix highlight error
  -- navigation, swap and editing treesitter
  use {'nvim-treesitter/nvim-treesitter-textobjects'}
  -- region selection using treesitter and hop
  use {'mfussenegger/nvim-treehopper'}
  use {'ThePrimeagen/refactoring.nvim'}

  -- === snippet engine ===
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'L3MON4D3/LuaSnip'}
  use {'saadparwaiz1/cmp_luasnip'}
  use {'rafamadriz/friendly-snippets'}

  -- === tmux ===
  use {'benmills/vimux'} -- tmux integration
  use {'christoomey/vim-tmux-navigator'} -- navigate between open tabs with C-h C-j C-k C-k
  use {'camgraff/telescope-tmux.nvim'} -- search tmux sessions, windows and tabs

  -- === colorscheme ===
  use {'norcalli/nvim-colorizer.lua'} -- show colors
  use {'ellisonleao/gruvbox.nvim'}
  use {'luisiacc/gruvbox-baby'}
  use {'Mofiqul/dracula.nvim'}
  use {'navarasu/onedark.nvim'}
  use {'JoosepAlviste/palenightfall.nvim'}
  use {'folke/tokyonight.nvim'}
  -- use {"wesleyegberto/nebula.nvim", requires = { "rktjmp/lush.nvim" }}
  use {'~/projects/github/open-sources/nebula.nvim', requires = { "rktjmp/lush.nvim" }}

  -- === session management ===
  use {'rmagatti/auto-session'}

  use {'renerocksai/telekasten.nvim'}
end)
