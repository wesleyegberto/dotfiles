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

This repository contains my personal dotfiles, configuration scripts, and custom settings for a streamlined development environment across multiple tools and operating systems.

## Setup Overview

These dotfiles configure various aspects of my system, including:

*   **Shell:** Zsh with Oh-My-Zsh and Zplugin
*   **Terminal:** Kitty and Ghostty
*   **Editor:** Neovim (Lua-based) and VS Code (with Vim extension)
*   **AI:** Opencode and Gemini
*   **Version Control:** Git
*   **Multiplexer:** Tmux
*   **Window Manager:** Aerospace (macOS)
*   **Fonts:** Microsoft Cascadia Code with ligatures

Aliases & Key mappings:

* [Terminal aliases](./docs/aliases.md)
* [Key mappings](./docs/key_mappings.md)

## Quick Installation

The `install.sh` script automates the symlinking of configuration files and the installation of Neovim plugins.

**Prerequisites:**

* Xcode Command Line Tools: `xcode-select --install`
* Homebrew (for macOS): `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
* FZF:
  * `brew install fd fzf the_silver_searcher ripgrep`
* Python deps and Pylint:
  * `pip install --user pynvim`
  * `pip3 install --user pynvim`
  * `pip3 install neovim-remote`

**Steps:**

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/wesleyegberto/dotfiles.git ~/.dotfiles
    ```
2.  **Run the installation script:**
    ```bash
    cd ~/.dotfiles
    ./install.sh
    ```
    This script will:
    *   Create symlinks for `.gitconfig`, `.zshrc`, `.tmux.conf`, Kitty, Ghostty, and Neovim configurations.
    *   Backup existing configuration files before creating symlinks.
    *   Run macOS-specific setup scripts, if on a Darwin system, to install all tools needed.
    *   Install Neovim's Packer plugin manager and then all Neovim plugins.

## Neovim Configuration (Lua-based)

My Neovim setup (version 0.11+) is entirely configured with Lua, emphasizing modularity and ease of maintenance.

**Key Features & Plugins:**

*   **LSP Integration:** `nvim-lspconfig`, `mason.nvim` for language server management, enhanced UI with `navbuddy`, `lspkind`, `lsp_signature`, `lsp-lens`, `fidget.nvim`, `trouble.nvim`.
*   **Fuzzy Finding:** `telescope.nvim` for efficient file, buffer, and command searching, with custom extensions for Git and language-specific tools.
*   **Syntax & Editing:** Advanced syntax highlighting (`nvim-treesitter`), automatic pairing (`nvim-autopairs`), text objects (`nvim-surround`), and commenting (`Comment.nvim`).
*   **Debugging:** Integrated debugging with `nvim-dap` and `nvim-dap-ui`.
*   **AI Integration:** `sidekick` for CLI AI interaction.
*   **Filetype-Specific Configs:** Custom settings for Java, C#, Python, TypeScript in `nvim/ftplugin`.
*   **Custom Snippets:** Personal code snippets for various languages.

**Configuration Structure:**

The `nvim/` directory is structured as follows:

*   `init.lua`: Main entry point for Neovim configuration.
*   `plugins.lua`: Manages all plugins using [Packer](https://github.com/wbthomason/packer.nvim).
*   `lua/`: Core Lua configurations.
    *   `config/`: Base settings (options, keybindings, colorscheme).
    *   `plug-config/`: Specific plugin configurations (telescope, treesitter, lsp, completion).
    *   `custom/`: Utility functions and buffer hooks.
    *   `telescope/`: Custom Telescope extensions.
*   `ftplugin/`: Filetype-specific settings (e.g., `java.lua`, `typescript.lua`).
*   `keybindings.vim` & `options.vim`: Legacy Vimscript for broader compatibility. Used in others softwares that support Neovim-like configuration.
*   `snippets/`: JSON-defined code snippets.

## VS Code

VS Code is configured with the Vim extension, mirroring many Neovim keybindings and features for a consistent editing experience.
Custom settings and key mappings are available in the linked Gist in the original README.

VS Code config files:

* [Settings](./vscode/settings.json): configuration to enable the same behavior (configs with prefix `vim.`).
* [Keybindings](./vscode/keybindings.json): key mappings to navigate between panes, double `j` on insert mode, go to definition and implementation, so on.

## Useful Resources

* [Oh-My-Zsh](https://ohmyz.sh/)
* [Tmux](https://github.com/tmux/tmux)
* [Kitty Terminal](https://sw.kovidgoyal.net/kitty/)
* [Ghostty Terminal](https://ghostty.org/)
* [Neovim](https://neovim.io/)
  * [Learn Neovim the Practical Way](https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f)
  * [Configure Neovim using Lua](https://icyphox.sh/blog/nvim-lua/)
* [Microsoft Cascadia Code Font](https://github.com/microsoft/cascadia-code)
* [Aerospace](https://github.com/nikitabobko/AeroSpace) (macOS Window Manager)
* Inspirations:
  * [macOS setup](https://github.com/mathiasbynens/dotfiles)
  * [semanticart dotfiles](https://github.com/semanticart/neovim-config)
* Tutorials:
  * [Configure Neovim using Lua](https://icyphox.sh/blog/nvim-lua/)
  * [Write init.lua](https://oroques.dev/notes/neovim-init/)
  * [YMDK SP64](https://github.com/qmk/qmk_firmware/tree/master/keyboards/ymdk/sp64)
