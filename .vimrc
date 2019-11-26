set encoding=utf-8
set termencoding=utf-8
"set backspace to work like in other editors
set backspace=2
" show line number
set number
"sytnax highlightning
syntax on
"indent settings
set shiftwidth=4
set tabstop=4
set expandtab
" always show status bar
set laststatus=2
"highlight search
set hlsearch
"show ruler
set colorcolumn=100
"cursorline
set cursorline
"enable gui stuff
if !has('nvim')
    set term=xterm-256color
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
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
"allow hidden buffers
set hidden
"folding
set foldmethod=indent
"workaround for nerdtree
let NERDTreeNodeDelimiter = "\t"
if !has('win32unix')
    " highlight current line
    " set line endings
    set ffs=unix
endif
"persistent undo
set undofile
set undodir=~/.vim/undodir
"disable tex rendering
let g:tex_conceal = ""
"Display unprintable characters f12 - switches
set list
"Unprintable chars mapping
set listchars=tab:•\ ,trail:•,extends:»,precedes:«

" remove whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

"filetype specific settings
autocmd Filetype cpp setlocal ts=2 sw=2 tw=100 expandtab colorcolumn=100
autocmd Filetype c setlocal ts=2 sw=2 tw=100 expandtab colorcolumn=100
autocmd Filetype markdown setlocal tw=80 colorcolumn=80
autocmd Filetype tex setlocal tw=80 colorcolumn=80
"git commit messages always at beginning
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

""""""""""""""""""""""""""""""""""""""""""
""" Plugins
""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex'
Plug 'rhysd/vim-grammarous'
Plug 'hzchirs/vim-material'
Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'luochen1990/rainbow'
Plug 'ryanoasis/vim-devicons'
Plug 'sjl/gundo.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Yggdroot/indentLine'
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'

" Initialize plugin system
call plug#end()

"color theme
colo vim-material

" rainbow config
let g:rainbow_active = 0
map <Leader>r :RainbowToggle<CR>

"YCM config
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_invoke_completion = '<c-x>'
"let g:ycm_log_level='debug'
"let g:ycm_server_python_interpreter = '/usr/bin/python'
"let g:ycm_show_diagnostics_ui = 1
"let g:ycm_max_diagnostics_to_display = 999
"let g:ycm_python_interpreter_path = ''

"NERDTree config
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1

" gundo
nnoremap <F5> :GundoToggle<CR>

" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

"Airline config
let g:airline_powerline_fonts = 1
let g:airline_theme='material'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"FZF/Command-T config
nnoremap <Leader>f :Files<CR>

"Autoformat
noremap <F8> :Autoformat<CR>

"Rainbow config
let g:rainbow_active = 0
map <Leader>r :RainbowToggle<CR>

"UltiSnips config
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:snips_author = "Sebastian Mueller"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', 'UltiSnips']

"Misc key mappings
noremap <F12> :syntax sync fromstart<CR>
"buffer navigation
nnoremap <space> <C-W><C-W>
nnoremap <tab> :bn<CR>
nnoremap <S-tab> :bp<CR>
"make
nnoremap <Leader>b :silent make\|redraw!\|cc<CR>

"ale
let g:ale_linters = {
\   'cpp': ['clangtidy'],
\   'python': ['flake8'],
\}
let g:ale_fixers= {
\   'cpp': ['clangtidy'],
\   'python': ['autopep8'],
\}
let g:airline#extensions#ale#enabled = 1

" Map Colemak keys to QWERTY keys (in alphabetical order).
"noremap n j
"noremap e k
"noremap i l

"noremap j e
"noremap k n
"noremap l i

"noremap N J
"noremap E K
"noremap I L

"noremap J E
"noremap K N
"noremap L I
