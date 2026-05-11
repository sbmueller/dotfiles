return {
  {
    "dhleong/trot.nvim",
    keys = {
      {
        "<leader>k",
        function()
          require("trot").search()
        end,
        desc = "Dash Search for Symbol",
      },
    },
  },
}
