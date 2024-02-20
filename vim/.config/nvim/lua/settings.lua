-- File for general vim settings

--set backspace to work like in other editors
vim.opt.backspace = "indent,eol,start"
vim.opt.number = true

--global indent settings (4 spaces)
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

--always show status bar
vim.opt.laststatus = 2
--highlight search
vim.opt.hlsearch = true
--show ruler globally
vim.opt.colorcolumn = "100"
--highlight current line
vim.opt.cursorline = true
--enable gui stuff
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.winblend = 50
vim.opt.pumblend = 50
--activate mouse support
vim.opt.mouse = "a"
--allow hidden buffers
vim.opt.hidden = true
--folding using TreeSitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
--persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
--Disable hiding of format characters
vim.opt.conceallevel = 0
--Display unprintable characters f12 - switches
vim.opt.list = true
--Unprintable chars mapping
vim.opt.listchars = {
  tab = "•\\ ",
  trail = "•",
  extends = "»",
  precedes = "«"
}

--Enable autocompletion
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.ttimeoutlen = 0
--fix width treatment of emojis
vim.opt.emoji = false

--ignore case in search when written in lowercase
vim.opt.ignorecase = true
vim.opt.smartcase = true

--use spellfile in dotfiles
vim.opt.spell = true
--Minimum distance in rows between cursor and screen edge
vim.opt.scrolloff = 5
--Leader Key
vim.g.mapleader = "'"

local spell_file = os.getenv("HOME") .. "/dotfiles/zf/spell/en.utf-8.add"
function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end
if file_exists(spell_file) then
  print("Found custom spell file")
  vim.opt.spellfile = spell_file
end
