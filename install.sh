#!/usr/bin/env bash
set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

# Script to install my files
echo 'Installing .vimrc'

echo 'Copying to ~/.vimrc'
cp ~/.vimrc ~/.vimrc_backup
ln -s `pwd`/.vimrc ~/.vimrc

echo 'Copying to ~/.config/nvim/init.vimrc'
cp ~/.config/nvim/init.vim ~/.config/nvim/init.vim_backup
ln -s `pwd`/.vimrc ~/.config/nvim/init.vim


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
