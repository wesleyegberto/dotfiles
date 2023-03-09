clear

CUR_DIR=$(pwd)

echo "===================="
echo " macOS Setup Script "
echo "===================="


sh ./macos_defaults.sh

echo "\\n\\n=== Installing and tools ==="

# Install Apple Command Line Tools
# xcode-select --install

if test ! "$( command -v brew )"; then
    echo "Installing homebrew"
    ruby -e "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# install brew dependencies from Brewfile
brew bundle

brew install cask htop vtop

brew install unrar wget tree
brew install fd fzf the_silver_searcher ripgrep gnu-sed

echo "\\n\\n === Automation tools ==="
brew cask install alfred
# brew install --cask raycast

# window management
brew install rectangle
brew install koekeishiya/formulae/yabai # daemon for macOS 11+
# brew install amethyst # ui

# global key bindinds
brew install koekeishiya/formulae/skhd

echo "\\n\\n === iTerm2 & Oh-My-Zsh & Tmux ==="
brew cask install iterm2

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

brew install tmux

echo "\\n\\n === Neovim ==="
brew install --HEAD luajit
brew install neovim

echo "\\n\\n === Dev Utils ==="
brew install git
brew install git-delta # git diff
git config --global --add --bool push.autoSetupRemove true

brew cask install dash
npm install -g tldr

brew install autojump
brew install httpie
brew cask install quicklook-json jq jo fx rq # JSON tools
brew cask install quicklook-csv xsv # CSV tools
brew cask install dasel # update JSON, YAML, TOML, XML, CSV files
brew cask install qlstephen # open everything as plaintext without warning
brew cask install qlmarkdown webpquicklook qlimagesize
brew install choose-rust # to use instead of `awk '{print $1}` -> `choose 0`
brew install sd # to use instead of `sed s/before/after/g` -> `sd 'before' 'after'`
brew install procs # modern `ps`
brew install bench
brew install graphviz

brew cask install docker-toolbox
brew install lazygit
brew install lazydocker
brew install jesseduffield/lazynpm/lazynpm

echo "\\n\\n=== Installing langs tools ==="
brew install asdf
brew install sdkman
brew install shellcheck
brew install node
brew install jenv
npm install -g n
# npm i -g vscode-langservers-extracted
# npm install -g @angular/language-server

echo "\\nInstalling Java tools"
DEV_TOOLS="~/dev-tools/ide/jdt-language-server"
mkdir -p $DEV_TOOLS
cd $DEV_TOOLS

wget https://download.eclipse.org/jdtls/milestones/1.9.0/jdt-language-server-1.9.0-202203031534.tar.gz

git clone https://github.com/microsoft/java-debug.git $DEV_TOOLS/java-debug
cd $DEV_TOOLS/java-debug
./mvnw clean install

git clone https://github.com/microsoft/vscode-java-test.git $DEV_TOOLS/vscode/java-test
cd $DEV_TOOLS/vscode-java-test
npm install
npm run build-plugin

cd $CUR_DIR

echo "\\n\\n=== Installing NPM packages ==="
npm install -g typescript
npm install -g vtop csvtojson # diff-so-fancy removed to use `delta`
npm install --global fkill-cli

echo "\\n\\n=== Installing editors: Sublime-Text, VS Code ==="
brew cask install sublime-text3
brew cask install visual-studio-code

echo "\\n\\n=== Installing browsers, spotify ==="
# brew cask install firefox
brew cask install google-chrome
brew install --cask brave-browser
brew cask install spotify

echo "\\n\\n=== Installing Neovim providers ==="
pip install --upgrade pip
pip3 install --user --upgrade neovim
npm install -g neovim

echo "\\n\\n=== Installing Paq-Nvim ==="
git clone https://github.com/savq/paq-nvim.git "$HOME"/.local/share/nvim/site/pack/paqs/opt/paq-nvim

echo "\\n\\n=== Setting up Powerline==="
cd ~ || exit
git clone https://github.com/powerline/fonts.git
cd fonts || exit
./install.sh
cd ..

echo "\\n\\n=== QMK Tools ==="
brew install qmk/qmk/qmk
qmk setup

echo "\\n\\n=== Installing Java ==="
sdk install java 11
sdk install java 17
sdk default java 17

echo "\\n\\n=== Cleaning up ==="
brew cask cleanup

echo "\\n\\n=== Starting Yabai and SKH ==="
brew services start yabai
brew services restart yabai

brew services start skhd

