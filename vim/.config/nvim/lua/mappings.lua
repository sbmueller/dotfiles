--File for general key mappings. Plugin specific key mappings are defined in the respective plugin files.

local wk = require("which-key")

wk.add(
  {
    { "n",          "nzz",                           desc = "Next occurence and center" },
    { "N",          "Nzz",                           desc = "Previous occurence and center" },
    { "<space>",    "<C-W><C-W>",                    desc = "Next Window" },
    { "<tab>",      "<cmd>bn<cr>",                   desc = "Next Buffer",                  mode = "n" },
    { "<S-tab>",    "<cmd>bp<cr>",                   desc = "Previous Buffer",              mode = "n" },
    { "<leader>RN", ":%s/<C-r><C-w>//g<Left><Left>", desc = "Replace word globally" }
  }
)

--Autoformat Toggle
wk.add(
  {
    { "<leader>a", "<cmd>FormatToggle<CR>", desc = "Toggle Autoformat" }
  }
)

--Terminal Mappings
wk.add(
  {
    { "<Esc>", "<C-\\><C-n>", desc = "Leave Terminal Mode", noremap = true, mode = "t" }
    --["<leader>t"] = {":vsplit term://zsh<CR>", "Open Terminal", noremap = true, mode = "n"}
  }
)
