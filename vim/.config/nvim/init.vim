set encoding=utf-8
set termencoding=utf-8
"set backspace to work like in other editors
set backspace=2
" show line number
set relativenumber
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
"Enable autocompletion
set completeopt=menu,menuone,noselect
set ttimeoutlen=0
"fix width treatment of emojis
set noemoji
" ignore case in search when written in lowercase
set ignorecase
set smartcase
"use spellfile in dotfiles
set spell
" Minimum distance in rows between cursor and screen edge
set scrolloff=5

"Misc key mappings
let mapleader = "'"
nnoremap n nzz
nnoremap N Nzz
"buffer navigation
nnoremap <silent><space> <C-W><C-W>
nnoremap <silent><tab> :bn<CR>
nnoremap <silent><S-tab> :bp<CR>

"filetype specific settings
let g:yaml_recommended_style = 0
autocmd Filetype cpp setlocal ts=4 sw=4 tw=140 expandtab colorcolumn=140
autocmd Filetype c setlocal ts=4 sw=4 tw=140 expandtab colorcolumn=140
autocmd Filetype markdown setlocal tw=79 colorcolumn=79
autocmd Filetype rst setlocal tw=79 colorcolumn=79
autocmd Filetype cmake setlocal tw=79 colorcolumn=79
autocmd Filetype tex setlocal tw=80 colorcolumn=80
autocmd Filetype yaml setlocal ts=4 sw=4 tw=80 expandtab colorcolumn=80
autocmd Filetype json setlocal ts=4 sw=4 tw=80 expandtab colorcolumn=80
autocmd Filetype python setlocal tw=0 colorcolumn=79
autocmd Filetype norg setlocal tw=80 sw=2 colorcolumn=80
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
Plug 'lewis6991/gitsigns.nvim' "Git (lua)
Plug 'nvim-lualine/lualine.nvim' "Status bar (lua)
Plug 'akinsho/bufferline.nvim' "Extended bufferline (lua)
Plug 'MunifTanjim/nui.nvim' " UI library (lua)
Plug 'rcarriga/nvim-notify' " Notification messages library (lua)
Plug 'eoh-bse/minintro.nvim' " Intro screen (lua)
" LSP
Plug 'neovim/nvim-lspconfig' " Nvim Language Server Protocol (lua)
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' } "(lua)
Plug 'ray-x/navigator.lua' " Extensive IDE features (lua)
"Autocompletion
Plug 'onsails/lspkind-nvim' " Pictograms for LSP (lua)
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip' " LuaSnip in autocompletion (lua)


" IDE features
Plug 'mfussenegger/nvim-dap' " Debug adapter (lua)
Plug 'theHamsta/nvim-dap-virtual-text' " Debug virtual text (lua)
Plug 'rcarriga/nvim-dap-ui' " UI config for dap (lua)
Plug 'nvim-telescope/telescope.nvim' " Fuzzy file search and more (lua)
Plug 'mfussenegger/nvim-lint' " Linter (lua)
Plug 'mhartington/formatter.nvim' " Formatter (lua)
Plug 'kyazdani42/nvim-tree.lua' " File browser (lua)
Plug 'numToStr/Comment.nvim' " Comment hotkeys (lua)
Plug 'lukas-reineke/indent-blankline.nvim' " Show vertical indent lines (lua)
Plug 'L3MON4D3/LuaSnip', {'do': 'make install_jsregexp'} " Snippet functionality (lua)
Plug 'rafamadriz/friendly-snippets' " Repository containing snippet files
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Syntax highlighting, indentation, folding (lua)
Plug 'nvim-treesitter/nvim-treesitter-refactor' " This provides go to def etc (lua)
Plug 'nvim-treesitter/nvim-treesitter-context' " Current context in top line (lua)
Plug 'danymat/neogen' " Documentation generator (lua)
Plug 'Maan2003/lsp_lines.nvim' " Diagnostics in virtual lines (lua)
Plug 'folke/noice.nvim' " Nice GUI enhancements (lua)
Plug 'ggandor/leap.nvim' " cursor movement system (lua)
Plug 'nvim-lua/lsp-status.nvim' " LSP status indicator (lua)
Plug 'Bryley/neoai.nvim' " ChatGPT (lua)
Plug 'folke/trouble.nvim' " Diagnostic issues view (lua)
Plug 'p00f/godbolt.nvim' " Compiler explorer (lua)

" themes / colors
Plug 'ryanoasis/vim-devicons' " Cool icons
Plug 'kyazdani42/nvim-web-devicons' " More cool icons
Plug 'folke/zen-mode.nvim' " Distraction free mode (lua)
Plug 'catppuccin/nvim', {'as': 'catppuccin'} " Color theme (lua)
Plug 'folke/paint.nvim' " Special highlights on keywords (lua)

" filetypes
Plug 'epwalsh/obsidian.nvim'
Plug 'lervag/vimtex' " LaTeX (vimscript)
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'chrisbra/csv.vim'
Plug 'norcalli/nvim-colorizer.lua' " Display color codes as colors (lua)

" Initialize plugin system
call plug#end()

"sytnax highlightning
syntax on

"color theme
"colo tokyonight
let g:catppuccin_flavour = "mocha" " latte, frappe, macchiato, mocha
colorscheme catppuccin

"Telescope
nnoremap <silent><leader>f <cmd>Telescope find_files<cr>
nnoremap <silent><leader>g <cmd>Telescope live_grep<cr>

"Replace
nnoremap <leader>RN :%s/<C-r><C-w>//g<left><left>

" indentline
let g:indentLine_setConceal = 0

" nvim tree
nnoremap <silent><C-n> :NvimTreeToggle<CR>

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

noremap <silent><F7> :AutoformatToggle<CR>

" Luasnip
lua require("luasnip.loaders.from_vscode").lazy_load() -- Snippets in path
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

" Linux specifics
let s:uname = substitute(system('uname -s'), '\n', '', '')
if s:uname == "Linux"
    set spellfile=~/dotfiles/zf/spell/en.utf-8.add
    lua require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/dotfiles/zf" } }) -- Custom ZF snippets
endif

" NeoAI
lua vim.treesitter.language.register("markdown", "neoai-output")
map <silent> <leader><space> :NeoAI<cr>
xnoremap <silent> <leader><space> :'<,'>NeoAIContext<cr>
vnoremap <silent> <leader><space> :'<,'>NeoAIContext<cr>

" Trouble
nnoremap <silent><leader>t <cmd>TroubleToggle<cr>

" Zen mode
nnoremap <silent><leader>z <cmd>ZenMode<cr>

" Load lua configs
lua require('treesitter-config')
lua require('cmp-config')
lua require('gitsigns-config')
lua require('telescope-config')
lua require('lint-config')
lua require('nvimtree-config')
lua require('navigator-config')
lua require('bufferline-config')
lua require('lualine-config')
lua require('indent-blankline-config')
lua require('formatter-config')
lua require('zen-mode-config')
lua require('colorizer-config')
lua require('neogen-config')
lua require('lsp_lines-config')
lua require('context-config')
lua require('catppuccin-config')
lua require('noice-config')
lua require('leap').add_default_mappings()
lua require('lsp-status-config')
lua require('Comment').setup()
lua require('paint-config')
lua require('neoai-config')
lua require('trouble').setup()
lua require('dap-config')
lua require('nvim-dap-virtual-text').setup()
lua require('dapui').setup()
lua require('godbolt-config')
lua require('minintro').setup()
lua require('obsidian-config')
