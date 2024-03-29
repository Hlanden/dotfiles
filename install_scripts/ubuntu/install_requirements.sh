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
	 $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim

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
mkdir -p $HOME/.fonts
unzip $HOME/FiraCode.zip -d $HOME/.fonts
rm $HOME/FiraCode.zip
fc-cache -fv

# AG silver search
sudo apt install silversearcher-ag

# Language servers
sudo npm install --global pyright
sudo apt-get install clangd-12
sudo npm i -g bash-language-server
wget https://github.com/redhat-developer/vscode-xml/releases/download/0.21.0/lemminx-linux.zip
mkdir -p $HOME/language-servers/lemminx-linux
unzip $HOME/lemminx-linux.zip -d $HOME/language-servers/lemminx-linux
mv $HOME/language-servers/lemminx-linux/lemminx-linux $HOME/language-servers/lemminx-linux/lemminx
rm -rf $HOME/lemminx-linux.zip

echo 'export "PATH=$PATH:$HOME/language-servers/lemminx-linux"' >> $HOME/.bashrc

# ZSH
sudo apt install zsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt install ripgrep
