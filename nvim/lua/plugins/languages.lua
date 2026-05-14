return {
  { 'mfussenegger/nvim-dap',
    dependencies = {
      'jay-babu/mason-nvim-dap.nvim',
      { 'rcarriga/nvim-dap-ui', dependencies = { 'nvim-neotest/nvim-nio' } },
      'theHamsta/nvim-dap-virtual-text',
    } },

  { 'mfussenegger/nvim-jdtls', ft = 'java' },

  -- csharp (run `:OmniSharpInstall`)
  { 'OmniSharp/omnisharp-vim', ft = { 'cs', 'vb' } },
  { 'Hoffs/omnisharp-extended-lsp.nvim', ft = { 'cs', 'vb' } },
  { 'GustavEikaas/easy-dotnet.nvim', ft = { 'cs', 'vb', 'fsproj' } },

  { 'iamcco/markdown-preview.nvim',
    build = function() vim.fn['mkdp#util#install']() end,
    ft = { 'markdown' } },
}
