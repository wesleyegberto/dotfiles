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

brew install cask htop vtop

brew install unrar wget tree
brew install fd fzf the_silver_searcher ripgrep

brew cask install alfred

echo "\\n\\n === iTerm2 & Oh-My-Zsh & Tmux ==="
brew cask install iterm2

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

brew install tmux # Tmux

echo "\\n\\n === Neovim ==="
brew install neovim # NeoVim

echo "\\n\\n === Dev Utils ==="
brew install git
brew install git-delta # git diff

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

brew cask install docker-toolbox
brew install lazygit
brew install lazydocker
brew install jesseduffield/lazynpm/lazynpm

echo "\\n\\n=== Installing langs tools ==="
brew install shellcheck
brew install node
brew install jenv
npm install -g n

echo "\\n\\n=== Installing NPM packages ==="
npm install -g typescript
npm install -g gtop vtop csvtojson # diff-so-fancy removed to use `delta`
npm install --global fkill-cli

echo "\\n\\n=== Installing editors: Sublime-Text, VS Code ==="
brew cask install sublime-text3
brew cask install visual-studio-code

echo "\\n\\n=== Installing browsers, spotify ==="
brew cask install firefox
brew cask install google-chrome
brew cask install spotify

echo "\\n\\n=== Installing Neovim providers ==="
pip install --upgrade pip
pip3 install --user --upgrade neovim
npm install -g neovim

git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim

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


brew cask install amethyst


echo "\\n\\n=== Cleaning up ==="
brew cask cleanup