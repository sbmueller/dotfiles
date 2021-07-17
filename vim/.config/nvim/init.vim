set termencoding=utf-8
"set backspace to work like in other editors
set backspace=2
" show line number
set number
"sytnax highlightning
syntax on
"global indent settings (4 spaces)
set shiftwidth=4
set tabstop=4
set expandtab
" always show status bar
set laststatus=2
"highlight search
set hlsearch
"show ruler globally
set colorcolumn=100
"cursorline
set cursorline
"enable gui stuff
set termguicolors
"activate mouse support
set mouse=a
"dark theme
set background=dark
"allow hidden buffers
set hidden
"folding
set foldmethod=indent
"persistent undo
set undofile
set undodir=~/.config/nvim/undodir
"disable tex rendering
let g:tex_conceal = ""
"Display unprintable characters f12 - switches
set list
"Disable hiding of format characters
set conceallevel=0
"Unprintable chars mapping
set listchars=tab:•\ ,trail:•,extends:»,precedes:«

set completeopt=menuone,noselect

"filetype specific settings
autocmd Filetype cpp setlocal ts=2 sw=2 tw=100 expandtab colorcolumn=100
autocmd Filetype c setlocal ts=2 sw=2 tw=100 expandtab colorcolumn=100
autocmd Filetype markdown setlocal tw=79 colorcolumn=79
autocmd Filetype rst setlocal tw=79 colorcolumn=79
autocmd Filetype cmake setlocal tw=79 colorcolumn=79
autocmd Filetype tex setlocal tw=80 colorcolumn=80
autocmd Filetype python setlocal tw=88 colorcolumn=88
"git commit messages always at beginning
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

"leader key
let mapleader = "'"
"buffer navigation
nnoremap <space> <C-W><C-W>
nnoremap <tab> :bn<CR>
nnoremap <S-tab> :bp<CR>

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'ray-x/lsp_signature.nvim'

Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
" themes / colors
Plug 'hzchirs/vim-material'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" filetypes
Plug 'lervag/vimtex'
Plug 'rust-lang/rust.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Initialize plugin system
call plug#end()

colo vim-material

"vimtex
let g:tex_flavor = 'latex'

"Airline config
let g:airline_powerline_fonts = 1
let g:airline_theme='material'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''

" nvim tree
nnoremap <C-n> :NvimTreeToggle<CR>
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_auto_open = 1

" CtrlSF
nmap <leader>a :CtrlSF -R ""<Left>
nmap <leader>A <Plug>CtrlSFCwordPath<CR>
let g:ctrlsf_ackprg = '/opt/local/bin/ag'
let g:ctrlsf_winsize = '33%'
let g:ctrlsf_auto_close = 0

"UltiSnips config
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:snips_author = "Sebastian Mueller"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', 'UltiSnips']

"indentLine
let g:indentLine_char='┆'
autocmd FileType markdown let g:indentLine_enabled=0

"ale
let g:ale_linters = {
\   'cpp': ['cppcheck', 'clangtidy'],
\   'python': ['pylint', 'mypy'],
\}
let g:ale_fixers= {
\   'cpp': ['clang-format', 'clangtidy'],
\   'python': ['black'],
\   'rust': ['rustfmt'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_cpp_clangtidy_checks = ['*']
let g:airline#extensions#ale#enabled = 1
let g:ale_type_map = {'flake8': {'ES': 'WS', 'E': 'W'}}
let g:ale_sign_error=''
let g:ale_sign_warning=''
let g:ale_fix_on_save = 0
hi link ALEErrorSign    Error
hi link ALEWarningSign  Warning

"fzf
noremap <leader>f :Files<CR>

" treesitter
lua require('treesitter')
lua require('nvim-lspconfig')
lua require('nvim-compe')
lua require('lsp-signature')
