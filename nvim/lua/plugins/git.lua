return {
  { 'tpope/vim-fugitive', cmd = { 'Git', 'Gdiffsplit', 'Gread', 'Gwrite', 'Gclog' } },
  { 'airblade/vim-gitgutter', event = 'BufReadPost' },
  { 'tveskag/nvim-blame-line', cmd = { 'EnableBlameLine', 'ToggleBlameLine' } },
  { 'sindrets/diffview.nvim', cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFileHistory' } },
  { 'akinsho/git-conflict.nvim', event = 'BufReadPost' },
  { 'aaronhallaert/advanced-git-search.nvim',
    cmd = 'AdvancedGitSearch',
    dependencies = { 'nvim-telescope/telescope.nvim', 'tpope/vim-fugitive' } },
}
