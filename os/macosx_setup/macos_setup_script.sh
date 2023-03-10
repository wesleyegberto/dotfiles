#!/usr/bin/env bash
set -e errexit

clear

ARCH=$(uname -m)
CUR_DIR=$(pwd)

echo "===================="
echo " macOS Setup Script "
echo "===================="

echo "\\n=== Installing and tools ==="

# Install Apple Command Line Tools
# xcode-select --install

if test ! "$( command -v brew )"; then
    echo "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew install htop
brew install wget tree
brew install fd fzf the_silver_searcher ripgrep gnu-sed

echo "\\n\\n=== Installing browsers, spotify ==="
# brew install --cask firefox
brew install --cask google-chrome
brew install --cask brave-browser
brew install --cask spotify

echo "\\n\\n === Automation tools ==="
brew install --cask alfred
# brew install --cask raycast

# window management
brew install koekeishiya/formulae/yabai # daemon for macOS 11+
brew install rectangle
# global key bindinds
brew install koekeishiya/formulae/skhd

echo "\\n\\n === Kitty & Tmux & Oh-My-Zsh ==="
/bin/bash -c "curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin"

brew install tmux

if [[ -z $ZSH ]]; then
    echo "Installing Oh-My-Zsh"
    /bin/bash -c sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [[ ! -d "$HOME/.zi/" ]]; then
    echo "Installing Zi plugin"
    sh -c "$(curl -fsSL get.zshell.dev)" -- -i skip -b main
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt" ]]; then
    echo "Installing Spaceship prompt"
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt" --depth=1
    ln -s "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
fi

echo "\\n\\n=== Setting up Powerline==="
cd $HOME
git clone https://github.com/powerline/fonts.git
cd fonts || exit
./install.sh
cd ..
rm -rf ./fonts
cd $CUR_DIR

echo "\\n\\n === Git ==="
brew install git
brew install git-delta # git diff
git config --global --add --bool push.autoSetupRemove true

echo "\\n\\n=== Installing langs tools ==="
brew install asdf
brew install shellcheck
brew install jenv
brew install jabba
if test ! "$( command -v sdk )"; then
    curl -s "https://get.sdkman.io" | bash
fi
if test ! "$( command -v node )"; then
    brew install node
fi
npm install -g n

echo "\\n\\n === Dev Utils ==="
brew install autojump
brew install httpie
brew install jq jo fx rq # JSON tools
brew install --cask quicklook-json # JSON tools
brew install xsv # CSV tools
brew install --cask quicklook-csv # CSV tools
brew install dasel # update JSON, YAML, TOML, XML, CSV files
brew install --cask qlstephen # open everything as plaintext without warning
brew install --cask qlmarkdown webpquicklook qlimagesize
brew install choose-rust # to use instead of `awk '{print $1}` -> `choose 0`
brew install sd # to use instead of `sed s/before/after/g` -> `sd 'before' 'after'`
brew install procs # modern `ps`
brew install bench
brew install graphviz

if [[ "$ARCH" == 'x86_64' ]]; then
    brew install --cask docker-toolbox
fi

if [[ "$ARCH" == 'amd64' ]]; then
    wget https://desktop.docker.com/mac/main/arm64/Docker.dmg
    hdiutil attach Docker.dmg
    /Volumes/Docker/Docker.app/Contents/MacOS/install
    hdiutil detach /Volumes/Docker
fi

brew install lazygit
brew install lazydocker
brew install jesseduffield/lazynpm/lazynpm

/bin/bash -c "brew install --cask dash"
npm install -g tldr

echo "\\n\\n=== Installing NPM packages ==="
npm install -g typescript
npm install -g vtop csvtojson # diff-so-fancy removed to use `delta`
npm install --global fkill-cli

echo "\\n\\n=== Installing Neovim & VS Code & Sublime-Text ==="
brew install --HEAD luajit
brew install neovim
brew install sublime-text
brew install --cask visual-studio-code

echo "\\n\\n=== Installing Neovim providers ==="
pip3 install --user --upgrade neovim
npm install -g neovim

echo "\\n\\n=== Installing Paq-Nvim ==="
if [[ ! -d "$HOME/.local/share/nvim/site/pack/paqs/opt/paq-nvim" ]]; then
    git clone https://github.com/savq/paq-nvim.git "$HOME"/.local/share/nvim/site/pack/paqs/opt/paq-nvim
fi

if [[ "$ARCH" == 'x86_64' ]]; then
    echo "\\n\\n=== QMK Tools ==="
    brew install qmk/qmk/qmk
    qmk setup
fi

echo "\\n\\n=== Installing Java ==="
if [[ "$ARCH" == 'x86_64' ]]; then
    sdk install java 11
    sdk install java 17
    sdk default java 17
fi
if [[ "$ARCH" == 'amd64' ]]; then
    jabba install microsoft@11
    jabba install openjdk@17
fi

echo "\\nInstalling Java tools"
DEV_TOOLS="$HOME/dev-tools/ide/jdt-language-server"
mkdir -p $DEV_TOOLS
cd $DEV_TOOLS

wget https://download.eclipse.org/jdtls/milestones/1.9.0/jdt-language-server-1.9.0-202203031534.tar.gz

if [[ ! -d "$DEV_TOOLS/java-debug" ]]; then
    git clone https://github.com/microsoft/java-debug.git $DEV_TOOLS/java-debug
    cd $DEV_TOOLS/java-debug
    ./mvnw clean install
fi

if [[ ! -d "$DEV_TOOLS/vscode-java-test" ]]; then
    git clone https://github.com/microsoft/vscode-java-test.git $DEV_TOOLS/vscode-java-test
    cd $DEV_TOOLS/vscode-java-test
    npm install
    npm run build-plugin
fi

cd $CUR_DIR

echo "\\n\\n=== Cleaning up ==="
brew cleanup cask

echo "\\n\\n=== Starting Yabai and SKH ==="
brew services start yabai
brew services restart yabai

brew services start skhd

