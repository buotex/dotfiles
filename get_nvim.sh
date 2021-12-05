#!/bin/bash
mkdir -p ~/bin
wget https://github.com/neovim/neovim/releases/download/v0.6.0/nvim.appimage -O ~/bin/nvim.appimage
chmod 755 ~/bin/nvim.appimage
cd ~/bin
./nvim.appimage --appimage-extract 
echo "alias vim=~/bin/squashfs-root/usr/bin/nvim" > ~/.$(hostname).zsh
ln -sf ~/.dotfiles/nvim ~/.config/nvim 
