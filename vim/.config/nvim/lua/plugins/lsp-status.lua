return {
  {
    "nvim-lua/lsp-status.nvim",
    lazy = true,
    event = "LspAttach",
    config = function()
      local lsp_status = require("lsp-status")
      lsp_status.config {
        current_function = false,
        show_filename = false
      }
      lsp_status.register_progress()
    end
  }
}
