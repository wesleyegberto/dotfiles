# My Dotfiles

My scripts and dotfiles for Zsh, Git, NeoVim.

## Instructions

### Git configuration

Copy the content of file `git/.gitconfig` to `~/.gitconfig`.

### Zsh

Copy the content of file `.zshrc` to `~/.zshrc`.

### NeoVim

Install de Vim plugin manager: `git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim`.

Copy the content of file `.vimrc` to `~/.config/nvim/init.vim`.

Then install the plugins by running: `vim +PluginInstall +qall`.

NeoVim Plugins:

* Files
  * [nerdtree](https://github.com/scrooloose/nerdtree)
  * [vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs)
  * [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
  * [vim-devicons](https://github.com/ryanoasis/vim-devicons)
  * [vim-nerdtree-syntax-highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight)
  * [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
* Visualization
  * [vim-numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle)
  * [vim-highlightedyank](https://github.com/machakann/vim-highlightedyank)
  * [vim-airline](https://github.com/vim-airline/vim-airline)
  * [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
  * Git
    * [vim-fugitive](https://github.com/tpope/vim-fugitive)
    * [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
* Navigation:
  * [vim-unimpaired](https://github.com/tpope/vim-unimpaired)
  * [vim-abolish](https://github.com/tpope/vim-abolish)
* Editing:
  * [Sublime-like multiple cursor edit](terryma/vim-multiple-cursors)
  * [vim-surround](https://github.com/tpope/vim-surround)
  * [delimitMate](https://github.com/Raimondi/delimitMate)
  * [auto-pairs](https://github.com/jiangmiao/auto-pairs)
  * [vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace)
  * [coc-nvim](https://github.com/neoclide/coc.nvim)
    * Coc [Extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions):
      * [coc-actions](https://github.com/iamcco/coc-actions)
      * [coc-snippets](https://github.com/neoclide/coc-snippets)
      * [coc-java](https://github.com/neoclide/coc-java)
  * [Language Client](https://github.com/autozimu/LanguageClient-neovim)
* Misc:
  * [vim-startify](https://github.com/mhinz/vim-startify)
  * [vim-which-key](https://github.com/liuchengxu/vim-which-key)
  * [vimux](https://github.com/benmills/vimux)
  * [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
  * [vim-repeat](https://github.com/tpope/vim-repeat)

## Configs

### Bash

I'm using iTerm2 + Oh-My-Zsh + Tmux.

### Fonts

Using Microsoft Cascadia Code with ligatures at all my apps (iTerm2, VS Code, Eclipse, so on).

## Links

* [iTerm2](https://iterm2.com/)
* [Oh-My-Zsh](https://ohmyz.sh/)
* [Tmux](https://github.com/tmux/tmux)
* [NeoVim](https://neovim.io/)
* [MS Cascadia Code](https://github.com/microsoft/cascadia-code)
