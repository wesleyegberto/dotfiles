# Install Apple Command Line Tools
xcode-select --install

if test ! "$( command -v brew )"; then
    echo "Installing homebrew"
    ruby -e "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"
fi

# install brew dependencies from Brewfile
brew bundle

brew install git

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# NeoVim
brew install neovim

brew install httpie

npm install -g n