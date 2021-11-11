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
"packadd! vimspector
"set python privder
let g:python3_host_prog = '$HOME/miniconda3/bin/python'
"Enable autocompletion
set completeopt=menuone,noselect
"sytnax highlightning
syntax on

"Misc key mappings
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
Plug 'nvim-lua/popup.nvim' "Lua popups (lua)
Plug 'nvim-lua/plenary.nvim' "Lua library (lua)
Plug 'nvim-telescope/telescope.nvim' "Fuzzy file search (lua)
Plug 'lewis6991/gitsigns.nvim' "Git (lua)
Plug 'nvim-lualine/lualine.nvim' "Status bar (lua)
Plug 'akinsho/bufferline.nvim' "Extended bufferline (lua)
" LSP
Plug 'neovim/nvim-lspconfig' "nvim Language Server Protocol (lua)
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' } "(lua)
Plug 'ray-x/navigator.lua' " Extensive IDE features (lua)
Plug 'hrsh7th/nvim-compe'    "Autocompletion (lua)
Plug 'ray-x/lsp_signature.nvim' "Function signatures (lua)
" IDE features
Plug 'mfussenegger/nvim-lint' "Linter (lua)
Plug 'sbdchd/neoformat' "Formatter (lua)
Plug 'kyazdani42/nvim-tree.lua' "File browser (lua)
Plug 'scrooloose/nerdcommenter' "Comment hotkeys (vimscript)
Plug 'lukas-reineke/indent-blankline.nvim' "indent lines (lua)
"Plug 'Yggdroot/indentLine' "Indent rulers
Plug 'qpkorr/vim-bufkill' "maintain buffer layout (vimscript)
Plug 'SirVer/ultisnips' "Text/code snippets functionality (vimscript)
Plug 'honza/vim-snippets' "Repository containing snippet files
Plug 'dyng/ctrlsf.vim' "Grep replacement (vimscript)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "Syntax highlighting, indentation, folding (lua)
Plug 'nvim-treesitter/nvim-treesitter-refactor' " this provides "go to def" etc (lua)
Plug 'lewis6991/spellsitter.nvim' "Spelling check using treesitter (lua)
" themes / colors
Plug 'ryanoasis/vim-devicons' "Cool icons
Plug 'kyazdani42/nvim-web-devicons' "More cool icons
Plug 'folke/tokyonight.nvim' "Alternative theme

" Debug
Plug 'puremourning/vimspector' " debugger (vimscript)

" filetypes
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} "markdown preview (lua)

" Initialize plugin system
call plug#end()

"color theme
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

"Telescope
nnoremap <leader>f <cmd>Telescope find_files<cr>

"UltiSnips config
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:snips_author = "Sebastian Mueller"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', 'UltiSnips']

"Replace
nnoremap <leader>RN :%s/<C-r><C-w>//g<left><left>

" indentline
let g:indentLine_setConceal = 0

" nvim tree
nnoremap <C-n> :NvimTreeToggle<CR>
let g:nvim_tree_quit_on_open = 1

"Gitsigns
nnoremap <silent><leader>b :Gitsigns blame_line<CR>

"Neoformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format-10',
    \ 'args': ['--style=file'],
    \ 'stdin': 1,
    \ }
let g:neoformat_enabled_python = []"['black']
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

"Vimspector
let g:vimspector_enable_mappings = 'HUMAN'

" Load lua configs
lua require('treesitter-config')
lua require('compe-config')
lua require('lsp-signature-config')
lua require('gitsigns-config')
lua require('telescope-config')
lua require('lint-config')
lua require('spellsitter-config')
lua require('nvimtree-config')
lua require('navigator-config')
lua require('bufferline-config')
lua require('lualine-config')
lua require('indent-blankline-config')
