return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "~/notes"
        }
      }
    }
  }
}
