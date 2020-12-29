set encoding=utf-8
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
"workaround for nerdtree
let NERDTreeNodeDelimiter = "\t"
"persistent undo
set undofile
set undodir=~/.vim/undodir
"disable tex rendering
let g:tex_conceal = ""
"Display unprintable characters f12 - switches
set list
"Disable hiding of format characters
set conceallevel=0
"Unprintable chars mapping
set listchars=tab:•\ ,trail:•,extends:»,precedes:«

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

"buffer navigation
nnoremap <space> <C-W><C-W>
nnoremap <tab> :bn<CR>
nnoremap <S-tab> :bp<CR>

"polyglot
let g:polyglot_disabled = ['latex']

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree'
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
Plug 'sheerun/vim-polyglot'
" filetypes
Plug 'lervag/vimtex'
Plug 'rust-lang/rust.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Initialize plugin system
call plug#end()

colo vim-material

"vimtex
let g:tex_flavor = 'latex'

"COC

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=500

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"Airline config
let g:airline_powerline_fonts = 1
let g:airline_theme='material'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''

"NERDTree config
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1

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
\   'python': ['flake8', 'mypy'],
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
let g:ale_fix_on_save = 1
hi link ALEErrorSign    Error
hi link ALEWarningSign  Warning

"fzf
noremap <leader>f :Files<CR>
