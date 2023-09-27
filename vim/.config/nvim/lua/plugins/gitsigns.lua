return {
  {
    "lewis6991/gitsigns.nvim",
    event = {"BufReadPre", "BufNewFile"},
    keys = {
      {"<leader>b", "<cmd>Gitsigns blame_line<cr>", desc = "Git Blame Line"}
    },
    opts = {}
  }
}
