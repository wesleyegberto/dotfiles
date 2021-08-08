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

echo "Copying terminal conf"
[ -f ~/.config/kitty/kitty.conf ] && cp ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf_backup
ln -s $DOTFILES/kitty/kitty.conf ~/.config/kitty/kitty.conf

echo "Copying .zshrc"
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.zshrc_backup
ln -s $DOTFILES/.zshrc ~/.zshrc

echo "Copying .tmux.conf"
[ -f ~/.tmux.conf ] && cp ~/.tmux.conf ~/.tmux.conf_backup
ln -s $DOTFILES/.tmux.conf ~/.tmux.conf

echo "Copying .vimrc"
[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc_backup
[ -f ~/.config/nvim/init.vim ] && mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim_backup

ln -s $DOTFILES/nvim/ftplugin ~/.config/nvim/ftplugin
ln -s $DOTFILES/nvim/plug-config ~/.config/nvim/plug-config
ln -s $DOTFILES/nvim/keys ~/.config/nvim/keys

# Neovim 0.4
# ln -s $DOTFILES/.vimrc ~/.vimrc
# ln -s $DOTFILES/.vimrc ~/.config/nvim/init.vim

# Neovim 0.5+
ln -s $DOTFILES/nvim/lua ~/.config/nvim/lua
ln -s $DOTFILES/init.lua ~/.config/nvim/init.lua

ln -s $DOTFILES/vscode.vimrc ~/vscode.vimrc

if [ $(uname -s) = "Darwin" ]; then
  sh ./macosx_setup/macos_setup_script.sh
fi

if test "$( command -v nvim )"; then
  echo "Cloning Neovim plugin manager"
  # git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim # Neovim 0.4
  git clone https://github.com/savq/paq-nvim.git "$HOME"/.local/share/nvim/site/pack/paqs/opt/paq-nvim # Neovim 0.5+

  echo "Installing Vim plugins"
  # vim +PluginInstall +qall # Neovim 0.4
  vim +PaqInstall +PaqUpdate +PaqClean +qall # Neovim 0.5+
fi