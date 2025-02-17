return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- load the colorscheme here
      -- require("eldritch").setup({transparent = true})
      vim.cmd.colorscheme "catppuccin-macchiato"
    end
  }
}
