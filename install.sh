# Script to install my files

echo 'Installing .vimrc'

echo 'Copying to ~/.vimrc'
ln -s `pwd`/.vimrc ~/.vimrc

echo 'Copying to ~/.config/nvim/init.vimrc'
ln -s `pwd`/.vimrc ~/.config/nvim/init.vimrc
