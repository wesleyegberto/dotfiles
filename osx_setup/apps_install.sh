# Install Apple Command Line Tools
xcode-select --install

if test ! "$( command -v brew )"; then
    echo "Installing homebrew"
    ruby -e "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"
fi

# install brew dependencies from Brewfile
brew bundle

brew install fd fzf

brew install git

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Tmux
brew install tmux

# NeoVim
brew install neovim

npm install -g n

# dev tools
brew install httpie
brew cask install qlstephen
brew cask install quicklook-json
brew cask install webpquicklook
brew cask install qlimagesize
