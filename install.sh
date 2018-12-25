#!/bin/bash
if ! [ -x "$(command -v port)" ]; then
    echo 'Error: install macports first.' >&2
    exit 1
fi

# install basics
sudo port install -N --quiet zsh wget git tmux fasd

#install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

#install P9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

#install vim
sudo port install -N --quiet vim +huge +python37 +clientserver

#install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#symlink all the files
ln -s ~/.dotfiles/.vimrc ~/.dotfiles/.vim ~/.dotfiles/.zshrc ~/.dotfiles/.tmux.conf ~
