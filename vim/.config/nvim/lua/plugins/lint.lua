return {
  {
    "mfussenegger/nvim-lint",
    lazy = true,
    ft = {"python", "cpp", "yaml"},
    config = function()
      require("lint").linters_by_ft = {
        cpp = {"cppcheck"},
        python = {"ruff"},
        yaml = {"yamllint"}
      }
    end
  }
}
