#!/usr/bin/env bash
set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

DOTFILES=$(pwd)

echo "Copying .dotfiles"
ln -s $(pwd) ~/.dotfiles/

echo "Copying .gitconfig"
[ -f ~/.gitconfig ] && cp ~/.gitconfig ~/.gitconfig_backup
cp $DOTFILES/.gitconfig ~/.gitconfig
ln -s $DOTFILES/.gitignore_global ~/.gitignore_global

echo "Copying .zshrc"
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.zshrc_backup
ln -s $DOTFILES/.zshrc ~/.zshrc

echo "Copying .tmux.conf"
[ -f ~/.tmux.conf ] && cp ~/.tmux.conf ~/.tmux.conf_backup
ln -s $DOTFILES/.tmux.conf ~/.tmux.conf

echo "Copying .vimrc"
[ -f ~/.vimrc ] && cp ~/.vimrc ~/.vimrc_backup
[ -f ~/.config/nvim/init.vim ] && cp ~/.config/nvim/init.vim ~/.config/nvim/init.vim_backup
ln -s $DOTFILES/nvim/.config/nvim/keys ~/.config/nvim/keys
ln -s $DOTFILES/nvim/.config/nvim/ftplugin ~/.config/nvim/ftplugin
ln -s $DOTFILES/nvim/.config/nvim/plug-config ~/.config/nvim/plug-config
ln -s $DOTFILES/nvim/.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s $DOTFILES/.vimrc ~/.vimrc
ln -s $DOTFILES/.vimrc ~/.config/nvim/init.vim

echo "Cloning Vundle.vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

if [ $(uname -s) = "Darwin" ]; then
  sh ./macosx_setup/macos_setup_script.sh
fi

if test "$( command -v nvim )"; then
  echo "Installing Vim plugins"
  vim +PluginInstall +qall
fi