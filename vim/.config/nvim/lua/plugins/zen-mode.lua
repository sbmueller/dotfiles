return {
  {
    "folke/zen-mode.nvim",
    lazy = true,
    cmd = "ZenMode",
    keys = {
      {"<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen-Mode"}
    },
    opts = {
      window = {
        width = 145
      },
      plugins = {
        tmux = {enabled = true}
      }
    }
  }
}
