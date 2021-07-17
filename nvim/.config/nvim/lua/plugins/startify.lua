-- === mhinz/vim-startify ===

-- :SLoad       load a session
-- :SSave[!]    save a session
-- :SDelete[!]  delete a session
-- :SClose      close a session

-- don't change to directory when selecting a file
vim.g.startify_files_number = 5
vim.g.startify_change_to_dir = 0
vim.g.startify_relative_path = 1
vim.g.startify_use_env = 1

-- custom startup list, only show MRU from current directory/project
vim.g.startify_lists = {
  { type = 'dir',       header = { 'Files ' .. vim.fn.getcwd() } },
  { type = 'sessions',  header = { 'Sessions' } },
  { type = 'bookmarks', header = { 'Bookmarks' } },
  { type = 'commands',  header = { 'Commands' } }
}

vim.startify_bookmarks = {
  { v = '~/.config/nvim/init.vim' },
  { l = '~/.config/nvim/init.lua' },
  { z = '~/.zshrc' },
  { g = '~/.gitconfig' }
}


vim.g.startify_commands = {
  { ['in'] = { 'Install Plugins', ':PaqInstall' } },
  { up = { 'Update Plugins' , ':PaqUpdate' } },
  { cl = { 'Clean Plugins'  , ':PaqClean' } },
}
vim.cmd('autocmd User Startified setlocal cursorline')
