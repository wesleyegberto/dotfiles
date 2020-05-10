#!/usr/bin/env bash
set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

echo "Copying .dotfiles"
ln -s $(pwd) ~/.dotfiles/

echo "Copying .gitconfig"
[ -f ~/.gitconfig ] && cp ~/.gitconfig ~/.gitconfig_backup
ln -s `pwd`/git/.gitconfig ~/.gitconfig
ln -s `pwd`/git/.gitignore_global ~/.gitignore_global

echo "Copying .zshrc"
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.zshrc_backup
ln -s `pwd`/.zshrc ~/.zshrc

echo "Copying .tmux.conf"
[ -f ~/.tmux.conf ] && cp ~/.tmux.conf ~/.tmux.conf_backup
ln -s `pwd`/.tmux.conf ~/.tmux.conf

echo "Copying .vimrc"
[ -f ~/.vimrc ] && cp ~/.vimrc ~/.vimrc_backup
[ -f ~/.config/nvim/init.vim ] && cp ~/.config/nvim/init.vim ~/.config/nvim/init.vim_backup
ln -s `pwd`/.vimrc ~/.vimrc
ln -s `pwd`/.vimrc ~/.config/nvim/init.vim

echo "Cloning Vundle.vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

if [ $(uname -s) = "Darwin" ]; then
  sh ./osx_setup/apps_install.sh
fi

if test "$( command -v nvim )"; then
  echo "Installing Vim plugins"
  vim +PluginInstall +qall
fi