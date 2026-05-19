return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      variant = "moon", -- auto, main, moon, or dawn
      dim_inactive_windows = true,
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
      vim.cmd.colorscheme("rose-pine")
      -- The colorscheme renders best without window/popup blending.
      vim.opt.winblend = 0
      vim.opt.pumblend = 0
    end,
  },
}
