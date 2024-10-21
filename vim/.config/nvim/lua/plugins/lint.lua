return {
  {
    "mfussenegger/nvim-lint",
    lazy = true,
    ft = {"python", "yaml"},
    config = function()
      require("lint").linters_by_ft = {
        python = {"ruff"},
        yaml = {"yamllint"}
      }
    end
  }
}
