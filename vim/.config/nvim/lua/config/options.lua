-- General Vim options

-- Leader key (set early; keymaps registered later assume this leader)
vim.g.mapleader = "'"

-- Support local project-level Lua/exrc files.
-- Since Neovim 0.9, `:trust`-based prompting is required, so this is safe.
vim.opt.exrc = true

-- Backspace behavior matches other editors
vim.opt.backspace = "indent,eol,start"

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Global indent settings (4 spaces; per-filetype overrides live in after/ftplugin)
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- UI / display
vim.opt.laststatus = 2
vim.opt.hlsearch = true
vim.opt.colorcolumn = "100"
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.winblend = 10
vim.opt.pumblend = 10

-- Mouse / buffers
vim.opt.mouse = "a"
vim.opt.hidden = true

-- Folding via Treesitter (foldexpr is set per-buffer in plugins/treesitter.lua)
vim.opt.foldenable = false

-- Persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Concealing & list characters
vim.opt.conceallevel = 1
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "•",
  extends = "»",
  precedes = "«",
}

-- Completion options (blink.cmp drives this; popup helps menu stability on 0.11+)
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.ttimeoutlen = 0

-- Fix width treatment of emojis
vim.opt.emoji = false

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Spell file lives in nvim/spell (sourced from dotfiles)
vim.opt.spell = true

-- Cursor breathing room
vim.opt.scrolloff = 5
