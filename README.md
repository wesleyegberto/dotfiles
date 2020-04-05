# My Dotfiles

My scripts and dotfiles for Zsh, Git, NeoVim.

## My Setup

### Bash

I'm using iTerm2 + Oh-My-Zsh + Tmux.

### Fonts

Using Microsoft Cascadia Code with ligatures on iTerm2, VS Code, Eclipse, so on.

## Instructions

### Git configuration

Copy the content of file `git/.gitconfig` to `~/.gitconfig`.

### Zsh

Install Zsh following [this steps](https://ohmyz.sh/).
`$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

Then install the plugin manager:
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"`

Copy the content of file `.zshrc` to `~/.zshrc`.

### NeoVim

Install NeoVim following [this steps](https://github.com/neovim/neovim/wiki/Installing-Neovim).
`brew install neovim`

Install de Vim plugin manager: `git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim`.

Copy the content of file `.vimrc` to `~/.config/nvim/init.vim`.

Then install the plugins by running: `vim +PluginInstall +qall`.

NeoVim Plugins:

* Theme
  * [dracule](https://github.com/dracula/vim)
* Files
  * [nerdtree](https://github.com/scrooloose/nerdtree)
  * [vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs)
  * [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
  * [vim-devicons](https://github.com/ryanoasis/vim-devicons)
  * [vim-nerdtree-syntax-highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight)
  * [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
  * [vim-buffergator](https://github.com/jeetsukumaran/vim-buffergator)
* Visualization
  * [vim-airline](https://github.com/vim-airline/vim-airline)
  * [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
  * [vim-numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle)
  * [vim-highlightedyank](https://github.com/machakann/vim-highlightedyank)
  * [vim-rainbow](frazrepo/vim-rainbow)
  * Git
    * [vim-fugitive](https://github.com/tpope/vim-fugitive)
    * [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
* Navigation:
  * [vim-unimpaired](https://github.com/tpope/vim-unimpaired)
* Editing:
  * [Sublime-like multiple cursor edit](terryma/vim-multiple-cursors)
  * [vim-surround](https://github.com/tpope/vim-surround)
  * [vim-sandwitch](https://github.com/machakann/vim-sandwich) - to be used
  * [delimitMate](https://github.com/Raimondi/delimitMate)
  * [auto-pairs](https://github.com/jiangmiao/auto-pairs)
  * [vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace)
  * [vim-abolish](https://github.com/tpope/vim-abolish)
  * [coc-nvim](https://github.com/neoclide/coc.nvim)
    * Coc [Extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions):
      * [coc-actions](https://github.com/iamcco/coc-actions)
      * [coc-snippets](https://github.com/neoclide/coc-snippets)
      * [coc-java](https://github.com/neoclide/coc-java)
  * [Language Client](https://github.com/autozimu/LanguageClient-neovim)
  * [vim-snippets](https://github.com/honza/vim-snippets)
  * [ultisnips](https://github.com/SirVer/ultisnips)
* Misc:
  * [vim-startify](https://github.com/mhinz/vim-startify)
  * [vim-which-key](https://github.com/liuchengxu/vim-which-key)
  * [vimux](https://github.com/benmills/vimux)
  * [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
  * [vim-repeat](https://github.com/tpope/vim-repeat)

### VSCode

I'm using VSCode with Vim extension which has my favorites Vim plugins (like vim-surround, vim-airline, vim commentary).
Using it I can use all the Vim power for editing and navigation.

#### Steps:

* Install VSCode;
* Install Vim extension;
* Optional: copy my settings.

I've exploring some configuration and key bindings to allow me to use the same keybindings that I'm using on NeoVim (like navigate between panes, motion, leader key and so on).
Here are my configs:

* [VSCode settings](https://gist.github.com/wesleyegberto/373c6b27a7b5952acf5fca872a0eafc4#file-settings-json): configuration to enable the same behavior (configs with prefix `vim.`),
* [VSCode Keybindings](https://gist.github.com/wesleyegberto/373c6b27a7b5952acf5fca872a0eafc4#file-keybindingsmac-json): keybindings to navigate between panes, double `j` on insert mode

## Links

* [iTerm2](https://iterm2.com/)
* [Oh-My-Zsh](https://ohmyz.sh/)
* [Tmux](https://github.com/tmux/tmux)
* [NeoVim](https://neovim.io/)
* Fonts:
  * [MS Cascadia Code](https://github.com/microsoft/cascadia-code)
  * [Jetbrains Mono](https://www.jetbrains.com/lp/mono/)
