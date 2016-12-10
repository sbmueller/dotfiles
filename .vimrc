source /opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
syntax on

set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader=","               " leader is comma
let g:EasyMotion_leader_key = '<Leader>'

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

