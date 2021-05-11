clear

echo "====================="
echo " Ubuntu Setup Script "
echo "====================="


echo "\\n\\n=== Installing PPA's ==="

add-apt-repository ppa:git-core/ppa
apt-add-repository ppa:sbasalaev/pub                        # Snes9x
apt-add-repository ppa:graphics-drivers/ppa

# Albert
apt-add-repository ppa:nilarimogard/webupd8

apt-add-repository ppa:numix/ppa
apt-add-repository ppa:noobslab/apps
add-apt-repository ppa:noobslab/macbuntu
apt-add-repository ppa:noobslab/themes
apt-add-repository ppa:docky-core/stable

apt-add-repository ppa:webupd8team/java
apt-add-repository ppa:tualatrix/ppa                        # Ubuntu Tweak
add-apt-repository ppa:trebelnik-stefina/ubuntu-tweak       # Ubuntu Tweak Tooll
# apt-add-repository ppa:elementary-os/stable
apt-add-repository ppa:snwh/ppa                             # Paper theme
apt-add-repository ppa:fossfreedom/rhythmbox-plugins
# add-apt-repository ppa:docky-core/stable
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Insync
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C

# echo "deb http://apt.insynchq.com/ubuntu xenial non-free contrib" >> /etc/apt/sources.list.d/insync.list
# add-apt-repository ppa:gnome3-team/gnome3-staging
# add-apt-repository ppa:gnome3-team/gnome3


echo "\\n\\n=== Update packages ==="
apt-get update


echo "\\n\\n=== Installing Apps ==="

apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
apt-get install tree fzf fd-find ripgrep
apt-get install git
apt-get install cpufrequtils indicator-cpufreq indicator-multiload

echo "\\n\\n === Neovim ==="
apt-get install zsh tmux i3

# Install Zsh e Oh My Zsh
apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Make Oh My Zsh default
chsh -s $(which zsh)

apt-get install neovim # NeoVim

# Install HTTPie
apt-get install httpie
apt-get install jo # JSON tools

# apt-get install unity-tweak-tool
# apt-get install ubuntu-tweak

apt-get install albert -y
apt-get install docky
gconftool-2 --type Boolean --set /apps/docky-2/Docky/Items/DockyItem/ShowDockyItem False

# apt-get install plank -y
# apt-get install plank-themer
# apt-get install macbuntu-os-plank-theme-lts-v7
# gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ show-dock-item false

apt-get install nethogs
apt-get install insync
apt install snapd

apt-get install fonts-powerline

# apt-get install docker.io
apt-get install docker-ce
groupadd docker
gpasswd -a $USER docker
newgrp docker

snap install sublime-text
snap install spotify

# apt-get install gnome-session

npm install -g diff-so-fancy
npm install -g tldr
npm install -g fkill-cli


echo "\\n\\n=== Installing langs tools ==="
apt-get install shellcheck
apt-get install node
apt-get install npm
apt-get install jenv
apt-get install python3-pip
npm install -g n

echo "\\n\\n=== Installing NPM packages ==="
npm install -g typescript csvtojson diff-so-fancy

echo "\\n\\n=== Installing Neovim providers ==="
pip install --upgrade pip
pip3 install --user --upgrade neovim
npm install -g neovim
apt-get install python3-neovim

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
