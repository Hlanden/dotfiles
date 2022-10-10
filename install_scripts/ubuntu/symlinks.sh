# NOTE: Use at own risk. This will overwrite all existing symlinks
mkdir -p $HOME/.config 

ln -sf $HOME/dotfiles/bash/.bashrc $HOME/.bashrc
ln -sf $HOME/dotfiles/bash/.bash_profile $HOME/.bash_profile
ln -sf $HOME/dotfiles/nvim $HOME/.config/nvim
ln -sf $HOME/dotfiles/tmux $HOME/.config/tmux
ln -sf $HOME/dotfiles/ranger $HOME/.config/ranger
ln -sf $HOME/dotfiles/ultisnips $HOME/.config/ultisnips
ln -sf $HOME/dotfiles/xsession/.xsessionrc $HOME/.xsessionrc

# alacritty
# TODO: i3
# TODO: picom
# TODO: polybar
# TODO: ultisnips
