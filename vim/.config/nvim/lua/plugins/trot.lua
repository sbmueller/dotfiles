return {
  {
    "dhleong/trot.nvim",
    lazy = true,
    keys = {
      { "<leader>k", "<cmd>lua require'trot'.search()<cr>", desc = "Dash Search for Symbol" }
    }
  }
}
