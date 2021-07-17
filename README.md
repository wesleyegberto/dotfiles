# My Dotfiles

```
##########################################################
#                            ___                         #
#                           /\_ \                        #
#  __  __  __     __    ____\//\ \      __   __  __      #
# /\ \/\ \/\ \  /'__`\ /',__\ \ \ \   /'__`\/\ \/\ \     #
# \ \ \_/ \_/ \/\  __//\__, `\ \_\ \_/\  __/\ \ \_\ \    #
#  \ \___x___/'\ \____\/\____/ /\____\ \____\\/`____ \   #
#   \/__//__/   \/____/\/___/  \/____/\/____/ `/___/> \  #
#   __          __       ___      ___            /\___/  #
#  /\ \        /\ \__  /'___\ __ /\_ \           \/__/   #
#  \_\ \    ___\ \ ,_\/\ \__//\_\\//\ \      __    ____  #
#  /'_` \  / __`\ \ \/\ \ ,__\/\ \ \ \ \   /'__`\ /',__\ #
# /\ \_\ \/\ \_\ \ \ \_\ \ \_/\ \ \ \_\ \_/\  __//\__, `\#
# \ \___,_\ \____/\ \__\\ \_\  \ \_\/\____\ \____\/\____/#
#  \/__,_ /\/___/  \/__/ \/_/   \/_/\/____/\/____/\/___/ #
#                                                        #
##########################################################
```

My scripts and dotfiles for Zsh, Tmux, NeoVim, Git.

## My Setup

* Bash: I'm using iTerm2 + Oh-My-Zsh + Tmux.
* Fonts: Microsoft Cascadia Code with ligatures on iTerm2, VS Code, Eclipse, so on.
* Windows manager: [Amethyst](https://ianyh.com/amethyst/).

Aliases & Key bindings:

* [Terminal aliases](./aliases.md)
* [NeoVim](./key_bindings.md)

## Instructions

First install Xcode: `xcode-select --install`

The folder `macosx_setup` contains the scripts to set the mac OS defaults and install the apps and tools.

`sh ./macosx_setup/macos_setup_script.sh`

### Manual Installation

#### Git configuration

Copy the content of file `.gitconfig` to `~/.gitconfig`.

#### Zsh

Install Zsh: `brew install zsh`

Install Oh-My-Zsh following [this steps](https://ohmyz.sh/):
`sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

Then install the plugin manager:
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"`

Copy the content of file `.zshrc` to `~/.zshrc`.

#### Tmux

Install Tmux following [this steps](https://github.com/tmux/tmux/wiki/Installing):
`brew install tmux`

Copy the content of file `.tmux.conf` to `~/.tmux.conf`.

#### NeoVim

Install NeoVim following [this steps](https://github.com/neovim/neovim/wiki/Installing-Neovim):
`brew install neovim`

Install de Vim plugin manager: `git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim`.

Copy the content of file `.vimrc` to `~/.config/nvim/init.vim`.

Then install the plugins by running: `vim +PluginInstall +qall`.

##### Dependencies

* FZF:
  * `brew install fd fzf the_silver_searcher ripgrep`
* Floaterm:
  * lazygit
  * lazydocker
  * lazynpm
* Python deps and Pylint:
  * `pip2 install --user pynvim`
  * `pip3 install --user pynvim`
  * `pip3 install neovim-remote`
* C#: open a `.cs` file and execute command `:OmniSharpInstall`

## Tools Configuration

### NeoVim

NeoVim Plugins:

* Plugin management:
  * [Vundle](https://github.com/VundleVim/Vundle.vim)
  * [Paq for Neovim 0.5+](https://github.com/savq/paq-nvim)
* Theme:
  * [Dracula](https://github.com/dracula/vim)
  * [Material](https://github.com/kaicataldo/material.vim)
  * [Molokai](https://github.com/fmoralesc/molokayo)
  * [OneDark](https://github.com/joshdick/onedark.vim)
  * [NeoDark](https://github.com/KeitaNakamura/neodark.vim)
  * [Purify](https://github.com/kyoz/purify)
  * [Gruvbox](https://github.com/morhetz/gruvbox)
* Icons:
  * [vim-devicons](https://github.com/ryanoasis/vim-devicons)
* Search (files, buffers, tabs, tags, marks):
  * [FZF](https://github.com/junegunn/fzf)
  * [FZF-Vim](https://github.com/junegunn/fzf.vim)
  * Neovim 0.5+
    * [Telescope](https://github.com/nvim-telescope/telescope.nvim)
* Visualization:
  * [spaceline.vim](https://github.com/glepnir/spaceline.vim)
  * [vim-rainbow](https://github.com/frazrepo/vim-rainbow)
  * Git:
    * [vim-fugitive](https://github.com/tpope/vim-fugitive)
    * [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
* Navigation:
  * [vim-unimpaired](https://github.com/tpope/vim-unimpaired)
  * [vim-easymotion](https://github.com/easymotion/vim-easymotion)
* Editing:
  * [Sublime-like multiple cursor edit](https://github.com/terryma/vim-multiple-cursors)
  * [vim-surround](https://github.com/tpope/vim-surround)
  * [auto-pairs](https://github.com/jiangmiao/auto-pairs)
  * [vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace)
  * [vim-commentary](https://github.com/tpope/vim-commentary)
  * [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (Neovim 0.5+)
* Intellisense
  * [coc-nvim](https://github.com/neoclide/coc.nvim)
    * Coc [Extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions) activated:
      * [coc-actions](https://github.com/iamcco/coc-actions)
      * [coc-explorer](https://github.com/weirongxu/coc-explorer)
      * [coc-snippets](https://github.com/neoclide/coc-snippets)
      * [coc-java](https://github.com/neoclide/coc-java)
      * [coc-omnisharp](https://github.com/coc-extensions/coc-omnisharp)
      * [coc-tsserver](https://github.com/neoclide/coc-tsserver)
  * [antoinemadec/coc-fzf](https://github.com/antoinemadec/coc-fzf)
  * [neovim/nvim-lspconfig](neovim/nvim-lspconfig) (Neovim 0.5+)
* Snippets
  * [vim-snippets](https://github.com/honza/vim-snippets)
  * [ultisnips](https://github.com/SirVer/ultisnips)
* Code Checker
  * [vim-syntastic](https://github.com/vim-syntastic/syntastic)
  * C#:
    * [Omnisharp-vim](https://github.com/OmniSharp/omnisharp-vim)
  * [vim-polyglot](https://github.com/sheerun/vim-polyglot)
* Misc:
  * [vim-startify](https://github.com/mhinz/vim-startify)
  * [Which-Key for Neovim 0.5+](https://github.com/liuchengxu/folke/which-key.nvim)
  * [vim-floaterm](https://github.com/voldikss/vim-floaterm)
  * [vimux](https://github.com/benmills/vimux)
  * [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

To be tested:

* Editing: [vim-sandwitch](https://github.com/machakann/vim-sandwich)
* Python Jedi tool: [jedi-vim](https://github.com/davidhalter/jedi-vim)
* Dashboard-nvim: [hardcoreplayers/dashboard-nvim](https://github.com/hardcoreplayers/dashboard-nvim)

Removed:

* File explorer (using coc-explorer):
  * [nerdtree](https://github.com/scrooloose/nerdtree)
  * [vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs)
  * [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
  * [vim-nerdtree-syntax-highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight)
* Visualization:
  * [vim-airline](https://github.com/vim-airline/vim-airline)
  * [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
  * [vim-bufferline](https://github.com/bling/vim-bufferline)
  * [vim-numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle)
  * [vim-highlightedyank](https://github.com/machakann/vim-highlightedyank)
* Buffer finder: [vim-buffergator](https://github.com/jeetsukumaran/vim-buffergator)
* Editing:
  * [vim-abolish](https://github.com/tpope/vim-abolish)
* Code checker for Java: [Language Client](https://github.com/autozimu/LanguageClient-neovim)
* Omnisharp-vim default mappings: [vim-sharpenup](https://github.com/nickspoons/vim-sharpenup)
* Misc:
  * [vim-which-key](https://github.com/liuchengxu/vim-which-key)

### VS Code

I'm using VSCode with Vim extension which has my favorites Vim plugins (like vim-surround, vim-airline).
Using it I can use all the Vim power for editing and navigation.

#### Steps:

* Install VSCode;
* Install Vim extension;
* Optional: copy my settings.

I've exploring some configuration and key bindings to allow me to use the same keybindings that I'm using on NeoVim (like navigate between panes, motion, leader key and so on).
Here are my configs:

* [VSCode settings](https://gist.github.com/wesleyegberto/373c6b27a7b5952acf5fca872a0eafc4#file-settings-json): configuration to enable the same behavior (configs with prefix `vim.`).
* [VSCode Keybindings](https://gist.github.com/wesleyegberto/373c6b27a7b5952acf5fca872a0eafc4#file-keybindingsmac-json): keybindings to navigate between panes, double `j` on insert mode, go to definition and implementation, so on.

## TODO

[X] Export Eclipse configurations

## Links

* [iTerm2](https://iterm2.com/)
* [Oh-My-Zsh](https://ohmyz.sh/)
* [Tmux](https://github.com/tmux/tmux)
* [NeoVim](https://neovim.io/)
* Fonts:
  * [MS Cascadia Code](https://github.com/microsoft/cascadia-code)
  * [Jetbrains Mono](https://www.jetbrains.com/lp/mono/)
* [Themes generator](https://themer.dev/)
* [iTerm Colorschemes](https://iterm2colorschemes.com/)
* [macOS setup inspiration](https://github.com/mathiasbynens/dotfiles)
* Tutorials:
  * [Configure Neovim using Lua](https://icyphox.sh/blog/nvim-lua/)
  * [Write init.lua](https://oroques.dev/notes/neovim-init/)
