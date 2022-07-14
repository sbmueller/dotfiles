set encoding=utf-8
set termencoding=utf-8
"set backspace to work like in other editors
set backspace=2
" show line number
set number
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
"let g:python3_host_prog = '$HOME/miniconda3/bin/python'
"Enable autocompletion
set completeopt=menu,menuone,noselect
set ttimeoutlen=0
"sytnax highlightning
syntax on
"fix width treatment of emojis
set noemoji
"use spellfile in dotfiles
set spell
set spellfile=~/dotfiles/zf/spell/en.utf-8.add
"custom snippet directory
let g:vsnip_snippet_dir = '~/dotfiles/zf/snippets'

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
let g:yaml_recommended_style = 0
autocmd Filetype yaml setlocal ts=4 sw=4 tw=80 expandtab colorcolumn=80
autocmd Filetype json setlocal ts=4 sw=4 tw=80 expandtab colorcolumn=80
autocmd Filetype python setlocal tw=0 colorcolumn=79
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
Plug 'jbyuki/instant.nvim'
" LSP
Plug 'neovim/nvim-lspconfig' "nvim Language Server Protocol (lua)
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' } "(lua)
Plug 'ray-x/navigator.lua' " Extensive IDE features (lua)
Plug 'ray-x/lsp_signature.nvim' "Function signatures (lua)
"Autocompletion
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'

" IDE features
Plug 'mfussenegger/nvim-lint' "Linter (lua)
Plug 'mhartington/formatter.nvim' "Formatter (lua)
Plug 'kyazdani42/nvim-tree.lua' "File browser (lua)
Plug 'scrooloose/nerdcommenter' "Comment hotkeys (vimscript)
Plug 'lukas-reineke/indent-blankline.nvim' "indent lines (lua)
Plug 'qpkorr/vim-bufkill' "maintain buffer layout (vimscript)
Plug 'hrsh7th/vim-vsnip' " Snippet functionality (vimscript)
Plug 'rafamadriz/friendly-snippets' "Repository containing snippet files
Plug 'dyng/ctrlsf.vim' "Grep replacement (vimscript)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "Syntax highlighting, indentation, folding (lua)
Plug 'nvim-treesitter/nvim-treesitter-refactor' " this provides "go to def" etc (lua)
Plug 'danymat/neogen'
Plug 'lewis6991/spellsitter.nvim' "Spelling check using treesitter (lua)

" themes / colors
Plug 'ryanoasis/vim-devicons' "Cool icons
Plug 'kyazdani42/nvim-web-devicons' "More cool icons
Plug 'folke/tokyonight.nvim' "Alternative theme
Plug 'folke/zen-mode.nvim' "zen mode

" Debug
Plug 'puremourning/vimspector' " debugger (vimscript)

" filetypes
Plug 'lervag/vimtex' "LaTeX (vimscript)
"Plug 'ellisonleao/glow.nvim' "Markdown Preview (lua)
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'chrisbra/csv.vim'
Plug 'nvim-neorg/neorg'
Plug 'norcalli/nvim-colorizer.lua'

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

"Replace
nnoremap <leader>RN :%s/<C-r><C-w>//g<left><left>

" indentline
let g:indentLine_setConceal = 0

" nvim tree
nnoremap <C-n> :NvimTreeToggle<CR>

"Gitsigns
nnoremap <silent><leader>b :Gitsigns blame_line<CR>

"Autocommands
augroup Fixers
    au!
    au BufWritePost,BufWinEnter * lua require('lint').try_lint()
    au BufWritePost *.c,*.cpp,*.cc,*.h,*.hpp,*.py,*.lua,*.md,*.yaml,*.json,*.rs call Autoformat()
augroup END

augroup TrimTrailingWhiteSpace
    au!
    au BufWritePre * %s/\s\+$//e
    au BufWritePre * %s/\n\+\%$//e
augroup END

noremap <F7> :AutoformatToggle<CR>

"Vimspector
let g:vimspector_enable_mappings = 'HUMAN'

"Instant
let g:instant_username = "Sebastian"

"vsnip
imap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-j>'
smap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-j>'

" Load lua configs
lua require('treesitter-config')
lua require('cmp-config')
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
lua require('formatter-config')
lua require('neorg-config')
lua require('zen-mode-config')
lua require('colorizer-config')
lua require('neogen-config')
