return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      -- require("eldritch").setup({transparent = true})
      -- require("catppuccin").setup(
      --   {
      --     transparent_background = true,
      --     integrations = {
      --       cmp = true,
      --       gitsigns = true,
      --       nvimtree = true,
      --       treesitter = true,
      --       notify = true
      --     }
      --   }
      -- )
      require("rose-pine").setup(
        {
          variant = "main", -- auto, main, moon, or dawn
          dim_inactive_windows = true
        }
      )
      vim.cmd.colorscheme "rose-pine"
      vim.opt.winblend = 0
      vim.opt.pumblend = 0
    end
  }
}
