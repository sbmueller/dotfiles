return {
  "folke/trouble.nvim",
  lazy = true,
  cmd = "TroubleToggle",
  keys = {
    {"<leader>i", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle Trouble"}
  },
  dependencies = {"nvim-tree/nvim-web-devicons"},
  opts = {}
}
