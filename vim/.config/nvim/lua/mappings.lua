--File for general key mappings. Plugin specific key mappings are defined in the respective plugin files.

local wk = require("which-key")

wk.register(
  {
    ["n"] = {"nzz", "Next occurence and center"},
    ["N"] = {"Nzz", "Previous occurence and center"},
    ["<space>"] = {"<C-W><C-W>", "Next Window"},
    ["<tab>"] = {"<cmd>bn<cr>", "Next Buffer"},
    ["<S-tab>"] = {"<cmd>bp<cr>", "Previous Buffer"},
    ["<leader>RN"] = {"<cmd>%s/<C-r><C-w>//g<left><left>", "Replace word globally"}
  }
)

--Autoformat Toggle
wk.register(
  {
    ["<leader>a"] = {AutoformatToggle, "Toggle Autoformat"}
  }
)