return {
  "folke/trouble.nvim",
  lazy = true,
  cmd = "TroubleToggle",
  keys = {
    {"<leader>t", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble"}
  },
  dependencies = {"nvim-tree/nvim-web-devicons"},
  opts = {}
}
