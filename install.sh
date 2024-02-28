#!/usr/bin/env bash
set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

DOTFILES=$(pwd)

echo "Copying .dotfiles"
if [[ ! -f $HOME/.dotfiles ]]; then
  ln -s $(pwd) $HOME/.dotfiles/
fi

echo "Copying .gitconfig"
[ -f $HOME/.gitconfig ] && mv $HOME/.gitconfig $HOME/.gitconfig_backup
[ -f $HOME/.gitignore_global ] && mv $HOME/.gitignore_global $HOME/.gitignore_global
cp $DOTFILES/gitconfig/.gitconfig $HOME/.gitconfig
ln -s $DOTFILES/gitconfig/.gitignore_global $HOME/.gitignore_global

echo "Copying Kitty conf"
mkdir -p $HOME/.config/kitty
[ -f $HOME/.config/kitty/kitty.conf ] && mv $HOME/.config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf_backup
[ -f $HOME/.config/kitty/current-theme.conf ] && mv $HOME/.config/kitty/current-theme.conf $HOME/.config/kitty/current-theme.conf_backup
ln -s $DOTFILES/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
ln -s $DOTFILES/kitty/current-theme.conf $HOME/.config/kitty/current-theme.conf

echo "Copying .zshrc"
[ -f $HOME/.zshrc ] && mv $HOME/.zshrc $HOME/.zshrc_backup
ln -s $DOTFILES/.zshrc $HOME/.zshrc

echo "Copying .tmux.conf"
[ -f $HOME/.tmux.conf ] && mv $HOME/.tmux.conf $HOME/.tmux.conf_backup
ln -s $DOTFILES/tmux/.tmux.conf $HOME/.tmux.conf

echo "Copying .vimrc"
[ -f $HOME/.vimrc ] && mv $HOME/.vimrc $HOME/.vimrc_backup
[ -f $HOME/.config/nvim/init.vim ] && mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/init.vim_backup

mkdir -p $HOME/.config/nvim
ln -s $DOTFILES/nvim/ftplugin $HOME/.config/nvim/ftplugin
ln -s $DOTFILES/nvim/plug-config $HOME/.config/nvim/plug-config
ln -s $DOTFILES/nvim/lua $HOME/.config/nvim/lua
ln -s $DOTFILES/nvim/snippets $HOME/.config/nvim/snippets
ln -s $DOTFILES/nvim/options.vim $HOME/.config/nvim/options.vim
ln -s $DOTFILES/nvim/keybindings.vim $HOME/.config/nvim/keybindings.vim
ln -s $DOTFILES/init.lua $HOME/.config/nvim/init.lua
ln -s $DOTFILES/vscode.vimrc $HOME/vscode.vimrc

echo "Copying Yabai and Skhd"
mkdir -p $HOME/.config/yabai
ln -s $DOTFILES/.config/yabai/yabairc $HOME/.config/yabai/yabairc
mkdir -p $HOME/.config/skhd
ln -s $DOTFILES/.config/skhd/skhdrc $HOME/.config/skhd/skhdrc
mkdir -p $HOME/.config/borders
ln -s $DOTFILES/.config/borders/borderssrc $HOME/.config/borders/borderssrc

if [[ $(uname -s) = "Darwin" ]]; then
  sh ./os/macosx_setup/macos_setup_script.sh
fi

if test "$( command -v nvim )"; then
  echo "Cloning Neovim plugin manager"
  if [[ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]]; then
    git clone https://github.com/wbthomason/packer.nvim "$HOME"/.local/share/nvim/site/pack/packer/start/packer.nvim
  fi

  echo "Installing Vim plugins"
  nvim +PackerUpdate +qall
fi
