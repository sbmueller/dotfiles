return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- load the colorscheme here
      -- require("eldritch").setup({transparent = true})
      require("catppuccin").setup(
        {
          transparent_background = true,
          integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            treesitter = true,
            notify = true
          }
        }
      )
      vim.cmd.colorscheme "catppuccin-macchiato"
      vim.opt.winblend = 0
      vim.opt.pumblend = 0
    end
  }
}
