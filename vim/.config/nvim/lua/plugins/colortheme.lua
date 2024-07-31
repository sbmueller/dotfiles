return {
  {
    "AmberLehmann/candyland.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      -- require("eldritch").setup({transparent = true})
      vim.cmd.colorscheme "candyland"
    end
  }
}
