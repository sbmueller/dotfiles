return {
  {
    "mfussenegger/nvim-lint",
    lazy = true,
    ft = {"python", "cpp"},
    config = function()
      require("lint").linters_by_ft = {
        cpp = {"cppcheck"},
        python = {"ruff"}
      }
    end
  }
}
