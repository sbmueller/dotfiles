return {
  {
    "gorbit99/codewindow.nvim",
    lazy = true,
    keys = {
      {
        "<leader>m",
        function()
          require("codewindow").toggle_minimap()
        end,
        desc = "Toggle Minimap"
      }
    },
    config = true
  }
}
