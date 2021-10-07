set encoding=utf-8
set termencoding=utf-8
"set backspace to work like in other editors
set backspace=2
" show line number
set number
set relativenumber
"global indent settings (4 spaces)
set shiftwidth=4
set tabstop=4
set expandtab
" always show status bar
set laststatus=2
"highlight search
set hlsearch
"show ruler globally
set colorcolumn=140
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
"folding using TreeSitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99
"persistent undo
set undofile
set undodir=~/.vim/undodir
"disable tex rendering
let g:tex_conceal = ""
"Disable hiding of format characters
set conceallevel=0
"Display unprintable characters f12 - switches
set list
"Unprintable chars mapping
set listchars=tab:•\ ,trail:•,extends:»,precedes:«
"debug settings
packadd termdebug
let g:termdebug_wide=1
"set python privder
let g:python3_host_prog = '$HOME/miniconda3/bin/python'
"Enable autocompletion
set completeopt=menuone,noselect
"sytnax highlightning
syntax on

"Misc key mappings
noremap <F9> :write <bar> edit <bar> TSBufEnable highlight<CR>
let mapleader = "'"
"buffer navigation
nnoremap <space> <C-W><C-W>
nnoremap <tab> :bn<CR>
nnoremap <S-tab> :bp<CR>

"filetype specific settings
autocmd Filetype cpp setlocal ts=4 sw=4 tw=140 expandtab colorcolumn=140
autocmd Filetype c setlocal ts=4 sw=4 tw=140 expandtab colorcolumn=140
autocmd Filetype markdown setlocal tw=79 colorcolumn=79
autocmd Filetype rst setlocal tw=79 colorcolumn=79
autocmd Filetype cmake setlocal tw=79 colorcolumn=79
autocmd Filetype tex setlocal tw=80 colorcolumn=80
autocmd Filetype python setlocal tw=79 colorcolumn=79
"git commit messages always at beginning
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

""""""""""""""""""""""""""""""""""""""""""
""" Plugins
""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" General
Plug 'nvim-lua/popup.nvim' "Lua popups
Plug 'nvim-lua/plenary.nvim' "Lua library
Plug 'nvim-telescope/telescope.nvim' "Fuzzy file search
Plug 'lewis6991/gitsigns.nvim' "Git
Plug 'vim-airline/vim-airline' "Status bar
" LSP
Plug 'neovim/nvim-lspconfig' "nvim Language Server Protocol
Plug 'tami5/lspsaga.nvim' "additional LSP features
Plug 'hrsh7th/nvim-compe'    "Autocompletion
Plug 'ray-x/lsp_signature.nvim' "Function signatures
" Productivity
Plug 'mfussenegger/nvim-lint' "Linter
Plug 'sbdchd/neoformat' "Formatter
Plug 'kyazdani42/nvim-tree.lua' "File browser
Plug 'scrooloose/nerdcommenter' "Comment hotkeys
Plug 'Yggdroot/indentLine' "Indent rulers
Plug 'qpkorr/vim-bufkill'
Plug 'SirVer/ultisnips' "Text/code snippets functionality
Plug 'honza/vim-snippets' "Repository containing snippet files
Plug 'dyng/ctrlsf.vim' "Grep replacement
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "Syntax highlighting, indentation, folding
Plug 'lewis6991/spellsitter.nvim' "Spelling check using treesitter
" themes / colors
Plug 'ryanoasis/vim-devicons' "Cool icons
Plug 'kyazdani42/nvim-web-devicons' "More cool icons
Plug 'challenger-deep-theme/vim' "Theme
Plug 'folke/tokyonight.nvim' "Alternative theme
" filetypes
"Plug 'wellle/context.vim'
"Plug 'romgrk/nvim-treesitter-context'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Initialize plugin system
call plug#end()

"color theme
"colo challenger_deep
colo tokyonight

" CtrlSF
nmap <leader>A :CtrlSF -R ""<Left>
nmap <leader>a <Plug>CtrlSFCwordPath<CR>
let g:ctrlsf_ackprg = '/usr/bin/ag'
let g:ctrlsf_winsize = '33%'
let g:ctrlsf_auto_close = 0
let g:ctrlsf_extra_backend_args = {
            \ 'ag': '-U --ignore-dir build'
            \ }

"Airline config
let g:airline_powerline_fonts = 1
let g:airline_theme='challenger_deep'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''

"Telescope
nnoremap <leader>f <cmd>Telescope find_files<cr>

"UltiSnips config
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:snips_author = "Sebastian Mueller"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', 'UltiSnips']

"ale
let g:ale_linters = {
            \   'cpp': ['clangtidy', 'cppcheck'],
            \   'python': ['pylint', 'mypy', 'pydocstyle'],
            \}
let g:ale_fixers= {
            \   'cpp': ['clang-format'],
            \   'python': ['black'],
            \   'xml': [],
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \}
let g:airline#extensions#ale#enabled = 1
let g:ale_type_map = {'flake8': {'ES': 'WS', 'E': 'W'}}
let g:ale_cpp_clangcheck_executable = "clang-check-12"
let g:ale_cpp_clangtidy_executable = "clang-tidy-12"
let g:ale_c_clangformat_executable = "clang-format-10"
let g:ale_c_clangformat_options = "-style=file"
let g:ale_python_black_options = "--config ~/.config/pyproject.toml"
let g:ale_fix_on_save = 1
nnoremap <F7> :ALELint<CR>
nnoremap <F8> :call ToggleFixOnSave()<cr>

function! ToggleFixOnSave()
    if g:ale_fix_on_save
        let g:ale_fix_on_save = 0
        echo "Disabled fix on save."
    else
        let g:ale_fix_on_save = 1
        echo "Enabled fix on save."
    endif
endfunction

"Replace
nnoremap <leader>RN :%s/<C-r><C-w>//g<left><left>

let g:indentLine_setConceal = 0

" nvim tree
nnoremap <C-n> :NvimTreeToggle<CR>
let g:nvim_tree_quit_on_open = 1

"Gitsigns
nnoremap <silent><leader>b :Gitsigns blame_line<CR>

"Lspsaga
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent><leader>h :Lspsaga code_action<CR>
nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent><C-k> :Lspsaga signature_help<CR>
nnoremap <silent><leader>rn :Lspsaga rename<CR>
nnoremap <silent><leader>d :Lspsaga show_line_diagnostics<CR>

"Neoformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format-10',
    \ 'args': ['--style=file'],
    \ 'stdin': 1,
    \ }
let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_basic_format_trim = 1
let g:neoformat_run_all_formatters = 1
let g:neoformat_verbose = 0 " only affects the verbosity of Neoformat

"Autocommands
augroup fixers
    au!
    au InsertLeave,BufWritePost,BufWinEnter <buffer> lua require('lint').try_lint()
    au BufWritePre * Neoformat
augroup END

"Compe
inoremap <silent><expr> <CR> compe#confirm('<CR>')

" Load lua configs
lua require('treesitter')
lua require('nvim-lspconfig')
lua require('nvim-compe')
lua require('lsp-signature')
lua require('nvim-gitsigns')
lua require('nvim-telescope')
lua require('nvim-lint')
lua require('nvim-spellsitter')
lua require('nvimtree')
lua require('nvim-lspsaga')
