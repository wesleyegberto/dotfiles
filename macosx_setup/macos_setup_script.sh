clear

echo "===================="
echo " macOS Setup Script "
echo "===================="


sh ./macos_defaults.sh

echo "\\n\\n=== Installing and tools ==="

# Install Apple Command Line Tools
# xcode-select --install

if test ! "$( command -v brew )"; then
    echo "Installing homebrew"
    ruby -e "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"
fi

# install brew dependencies from Brewfile
brew bundle

brew install cask
brew install htop

brew install unrar wget
brew install tree fd fzf
brew install the_silver_searcher
brew install ripgrep

brew cask install alfred

brew install git
brew install lazygit

brew cask install iterm2

echo "\\n\\n === Oh-My-Zsh ==="
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

brew install tmux # Tmux

echo "\\n\\n === Neovim ==="
brew install neovim # NeoVim

# dev utils
brew install httpie
brew cask install qlstephen # open everything as plaintext without warning
brew cask install quicklook-csv
brew cask install quicklook-json
brew cask install qlmarkdown
brew cask install webpquicklook
brew cask install qlimagesize

brew cask install dash
brew cask install docker-toolbox
brew install lazydocker

echo "\\n\\n=== Installing langs tools ==="
brew install shellcheck
brew install node
brew install jenv
npm install -g n
brew install jesseduffield/lazynpm/lazynpm

echo "\\n\\n=== Installing NPM packages ==="
npm install -g typescript csvtojson diff-so-fancy

echo "\\n\\n=== Installing editors: Sublime-Text, VS Code ==="
brew cask install sublime-text3
brew cask install visual-studio-code

echo "\\n\\n=== Installing browsers, spotify ==="
brew cask install firefox
brew cask install google-chrome
brew cask install spotify

echo "\\n\\n=== Installing Neovim providers ==="
pip install --upgrade pip
pip2 install --user --upgrade neovim
pip3 install --user --upgrade neovim
npm install -g neovim

echo "\\n\\n=== Installing coc-vim ==="
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


echo "\\n\\n=== Setting up Powerline==="
cd ~ || exit
git clone https://github.com/powerline/fonts.git
cd fonts || exit
./install.sh
cd ..

echo "\\n\\n=== Cleaning up ==="
brew cask cleanup