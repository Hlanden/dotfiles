#!/bin/sh
      
i3-msg 'workspace 1; append_layout ~/.dotfiles/i3/layouts/firefox.json; exec firefox'
# i3-msg 'workspace 9; append_layout ~/.dotfiles/i3/layouts/spotify.json; exec /usr/bin/spotify'
i3-msg 'workspace 3; append_layout ~/.dotfiles/i3/layouts/latex.json; exec alacritty; exec alacritty;'
i3-msg 'workspace 2; append_layout ~/.dotfiles/i3/layouts/programming.json; exec alacritty'
