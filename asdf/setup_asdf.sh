asdf plugin-add direnv
asdf plugin-add python
asdf install direnv latest
asdf global direnv latest
asdf install python latest
mkdir -p ~/.config/direnv
mkdir -p ~/bin
ln -sf ~/.dotfiles/asdf/direnvrc ~/.config/direnv
