"set laststatus=2
set encoding=utf-8
set termencoding=utf-8
"set backspace to work like in other editors
set backspace=2
"indent settings
set shiftwidth=4
set tabstop=4
set expandtab
"show ruler
set colorcolumn=85
"enable gui stuff
if !has('nvim')
	set term=xterm-256color
	set termguicolors
	set ttymouse=xterm2
endif
if &term =~ '256color'
	set t_ut=
endif
"line numbers
set nu
"activate mouse support
set mouse=a
"dark theme
set background=dark
"sytnax highlightning
syntax on
"folding
set foldmethod=indent
"workaround for nerdtree
let NERDTreeNodeDelimiter = "\t"

" Vundle section
set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader=","               " leader is comma
let g:EasyMotion_leader_key = '<Leader>'
set listchars=tab:▸\ ,trail:·
set list

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'Valloric/YouCompleteMe'
" Plugin 'lifepillar/vim-mucomplete'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rdnetto/YCM-Generator'
Plugin 'rhysd/vim-crystal'
Plugin 'rhysd/vim-grammarous'
Plugin 'hzchirs/vim-material'
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"color theme
colo vim-material

"YCM config
let g:ycm_confirm_extra_conf = 0

"NERDTree config
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

"Airline config
let g:airline_powerline_fonts = 1
let g:airline_theme='material'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"FZF config
nnoremap <Leader>f :Files<CR>

"Build command
map <Leader>b :!make<CR>

"Misc key mappings
nnoremap <tab> <C-W><C-W>
nnoremap <S-tab> :bn<CR>
