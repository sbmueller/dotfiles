#!/bin/bash
if [ -x "$(command -v port)" ]; then
    # install basics
    sudo port install -N --quiet zsh wget git tmux fasd
    #install vim
    sudo port install -N --quiet vim +huge +python37 +clientserver
fi

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#install P9k
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

#symlink all the files
ln -s ~/.dotfiles/.vimrc ~/.dotfiles/.zshrc ~/.dotfiles/.tmux.conf ~
ln -s ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

#install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
