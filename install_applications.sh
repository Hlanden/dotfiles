# general 
cd 
sudo apt install git
sudo apt install python3-pip

# nvim
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
cd neovim && make
sudo make install
pip install pynvim

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# TODO: alacritty
# TODO: i3
# TODO: keyboard
# TODO: picom
# TODO: polybar

# powerline
pip install powerline-status

# ranger
sudo apt install ranger 

# tmux
sudo apt install tmux

# neofetch
sudo apt install neofetch

# node
curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
sudo apt-get install -y nodejs
