return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>i", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle Trouble" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
}
