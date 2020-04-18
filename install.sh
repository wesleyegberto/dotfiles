#!/usr/bin/env bash
set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

echo 'Copying .dotfiles'
ln -s $(pwd) ~/.dotfiles

# Script to install my files
echo 'Copying .vimrc'
[ -f ~/.vimrc ] && cp ~/.vimrc ~/.vimrc_backup
[ -f ~/.config/nvim/init.vim ] && cp ~/.config/nvim/init.vim ~/.config/nvim/init.vim_backup
ln -s `pwd`/.vimrc ~/.vimrc
ln -s `pwd`/.vimrc ~/.config/nvim/init.vim

echo 'Copying .tmux.conf'
[ -f ~/.tmux.conf ] && cp ~/.tmux.conf ~/.tmux.conf
ln -s `pwd`/.tmux.conf ~/.tmux.conf

echo 'Installing coc-vim'
# for neovim
mkdir -p ~/.local/share/nvim/site/pack/coc/start
cd ~/.local/share/nvim/site/pack/coc/start
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -

# Install extensions
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi
# Change extension names to the extensions you need
npm install coc-actions coc-snippets coc-java --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
