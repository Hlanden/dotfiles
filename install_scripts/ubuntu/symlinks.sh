# NOTE: Use at own risk. This will overwrite all existing symlinks
mkdir -p ~/.config 

ln -sf ~/dotfiles/bash/.bashrc ~/.bashrc
ln -sf ~/dotfiles/bash/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/tmux ~/.config/tmux
ln -sf ~/dotfiles/ranger ~/.config/ranger
ln -sf ~/dotfiles/ultisnips ~/.config/ultisnips
ln -sf ~/dotfiles/xsession/.xsessionrc ~/.xsessionrc

# alacritty
# TODO: i3
# TODO: picom
# TODO: polybar
# TODO: ultisnips
