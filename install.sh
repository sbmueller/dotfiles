#!/bin/bash
# TODO this file is deprecated, needs revision on a fresh system
if [ -x "$(command -v brew)" ]; then
    brew install stow
fi
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
#zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#symlink all the files
stow alacritty
stow tmux
stow vim
stow zsh

#install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
