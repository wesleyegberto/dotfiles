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

* Bash: I'm using Kitty + Oh-My-Zsh + Tmux.
* Fonts: Microsoft Cascadia Code with ligatures on iTerm2, VS Code, so on.
* Windows manager: [Amethyst](https://ianyh.com/amethyst/).

Aliases & Key mappings:

* [Terminal aliases](./docs/aliases.md)
* [Key mappings](./docs/key_mappings.md)

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

Copy the content of file `tmux/.tmux.conf` to `~/.tmux.conf`.

#### NeoVim

Install NeoVim following [this steps](https://github.com/neovim/neovim/wiki/Installing-Neovim):
`brew install neovim`

**Neovim 0.4**

For Neovim 0.4, see [this branch](https://github.com/wesleyegberto/dotfiles/tree/neovim-0.4).

**Neovim 0.5+ with Lua**

Install Paq plugin manager:

`git clone https://github.com/savq/paq-nvim.git "$HOME"/.local/share/nvim/site/pack/paqs/opt/paq-nvim`

Copy the content of file `init.lua` to `~/.config/nvim/init.lua`.

Then install the plugins by running: `vim +PaqInstall +qall`.

##### Dependencies

* FZF:
  * `brew install fd fzf the_silver_searcher ripgrep`
* Floaterm:
  * lazygit
  * lazydocker
  * lazynpm
* Python deps and Pylint:
  * `pip install --user pynvim`
  * `pip3 install --user pynvim`
  * `pip3 install neovim-remote`
* C#: open a `.cs` file and execute command `:OmniSharpInstall`

## Tools Configuration

### NeoVim

I'm using Neovim 0.5+ configured with Lua.
NeoVim plugins installed is listed [here](nvim/.config/nvim/lua/plugins.lua).

### VS Code

I'm using VSCode with Vim extension which has my favorites Vim plugins (like vim-surround, vim-airline).
Using it I can use all the Vim power for editing and navigation.

I've been exploring some configuration and key mappings to allow me to use the same mappings that I'm using on NeoVim (like navigate between panes, motion, leader key and so on).
Here are my configs:

* [VSCode settings](https://gist.github.com/wesleyegberto/373c6b27a7b5952acf5fca872a0eafc4#file-settings-json): configuration to enable the same behavior (configs with prefix `vim.`).
* [VSCode key mappings](https://gist.github.com/wesleyegberto/373c6b27a7b5952acf5fca872a0eafc4#file-keybindingsmac-json): key mappings to navigate between panes, double `j` on insert mode, go to definition and implementation, so on.

## Links

* [Kitty](https://sw.kovidgoyal.net/kitty/)
* [Oh-My-Zsh](https://ohmyz.sh/)
* [Tmux](https://github.com/tmux/tmux)
* [NeoVim](https://neovim.io/)
  * [Learn Neovim the Pratical Way](https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f)
* Fonts:
  * [MS Cascadia Code](https://github.com/microsoft/cascadia-code)
  * [Jetbrains Mono](https://www.jetbrains.com/lp/mono/)
* [macOS setup inspiration](https://github.com/mathiasbynens/dotfiles)
* Tutorials:
  * [Configure Neovim using Lua](https://icyphox.sh/blog/nvim-lua/)
  * [Write init.lua](https://oroques.dev/notes/neovim-init/)
  * [YMDK SP64](https://github.com/qmk/qmk_firmware/tree/master/keyboards/ymdk/sp64)

