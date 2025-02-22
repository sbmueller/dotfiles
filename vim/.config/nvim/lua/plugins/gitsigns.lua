return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = {"BufReadPost", "BufNewFile"},
    keys = {
      {"<leader>b", "<cmd>Gitsigns blame_line<cr>", desc = "Git Blame Line"}
    },
    opts = {}
  }
}
