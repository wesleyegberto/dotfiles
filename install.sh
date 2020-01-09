# Script to install my files

echo 'Installing .vimrc'

echo 'Copying to ~/.vimrc'
cp ~/.vimrc ~/.vimrc_backup
ln -s `pwd`/.vimrc ~/.vimrc

echo 'Copying to ~/.config/nvim/init.vimrc'
cp ~/.config/nvim/init.vim ~/.config/nvim/init.vim_backup
ln -s `pwd`/.vimrc ~/.config/nvim/init.vim
