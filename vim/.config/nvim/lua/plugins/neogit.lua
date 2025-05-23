return {
  {
    "NeogitOrg/neogit",
    lazy = true,
    cmd = "Neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim" -- optional
    },
    opts = {
      graph_style = "unicode"
    }
  }
}
