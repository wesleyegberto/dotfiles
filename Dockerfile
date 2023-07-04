FROM ubuntu

RUN apt-get update

RUN apt-get install -y software-properties-common

RUN apt-get install -y python3.8 python3.8-dev python-dev python3-dev

RUN add-apt-repository ppa:neovim-ppa/unstable
RUN apt-get update
RUN apt-get install -y neovim

RUN useradd -ms /bin/bash neo
USER neo
WORKDIR /home/neo/

# Setup
RUN mkdir -p ./.config/nvim/lua/
COPY init.lua ./.config/nvim/init.lua
COPY nvim/.config/nvim/ ./.config/nvim/

RUN echo "alias ev='nvim ~/.config/nvim/init.lua'" >> ./.bash_aliases

ENTRYPOINT sh
