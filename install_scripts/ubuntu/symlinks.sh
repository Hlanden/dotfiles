# NOTE: Use at own risk. This will overwrite all existing symlinks
mkdir -p $HOME/.config 

ln -s $HOME/dotfiles/zsh/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/zsh/.profile $HOME/.profile
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
ln -s $HOME/dotfiles/tmux $HOME/.config/tmux
ln -s $HOME/dotfiles/ranger $HOME/.config/ranger
ln -s $HOME/dotfiles/xsession/.xsessionrc $HOME/.xsessionrc
ln -s $HOME/dotfiles/i3 $HOME/.config/i3
ln -s $HOME/dotfiles/alacritty $HOME/.config/alacritty
ln -s $HOME/dotfiles/tmux $HOME/.config/tmux
ln -s $HOME/dotfiles/polybar $HOME/.config/polybar
