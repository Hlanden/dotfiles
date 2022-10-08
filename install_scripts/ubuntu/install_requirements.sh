# If full installation: 
# TODO: alacritty
# TODO: i3-gaps https://github.com/Airblader/i3
# TODO: picom
# TODO: polybar

# Minimal installation:
# TODO: keyboard

sudo apt update
# general 
cd 
sudo apt install git
sudo apt install python3-pip

# nvim
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

sudo apt-get install python3-neovim
# packer (neovim package manager)
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
	 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# powerline
pip install powerline-status

# ranger
sudo apt install ranger 

# tmux
sudo apt install tmux

# node
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# fonts
sudo apt-get install fonts-powerline
sudo apt install fonts-firacode

sudo apt-get install unzip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip
mkdir -p ~/.fonts
unzip ~/FiraCode.zip -d ~/.fonts
rm ~/FiraCode.zip
fc-cache -fv

# Language servers
sudo npm install --global pyright
sudo apt-get install clangd-12
sudo npm i -g bash-language-server

