-- General-purpose key mappings. Plugin-specific mappings live alongside their
-- plugin spec under lua/plugins/.
--
-- which-key.nvim picks up the `desc` fields automatically; we don't `require`
-- it here so it can stay lazy-loaded.

local map = vim.keymap.set

-- Search & navigation
map("n", "n", "nzz", { desc = "Next occurence and center" })
map("n", "N", "Nzz", { desc = "Previous occurence and center" })
map("n", "<space>", "<C-W><C-W>", { desc = "Next Window" })

-- Buffer navigation
map("n", "<tab>", "<cmd>bn<cr>", { desc = "Next Buffer" })
map("n", "<S-tab>", "<cmd>bp<cr>", { desc = "Previous Buffer" })

-- Quick word replace
map("n", "<leader>RN", ":%s/<C-r><C-w>//g<Left><Left>", { desc = "Replace word globally" })

-- Autoformat toggle (FormatToggle is defined by conform.nvim spec)
map("n", "<leader>a", "<cmd>FormatToggle<CR>", { desc = "Toggle Autoformat" })

-- Terminal-mode escape
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Leave Terminal Mode", noremap = true })
