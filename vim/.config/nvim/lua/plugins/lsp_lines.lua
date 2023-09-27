return {
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "LspAttach",
    keys = {
      {
        "<leader>l",
        function()
          require("lsp_lines").toggle()
        end,
        desc = "Toggle LSP Lines"
      }
    },
    config = function()
      require("lsp_lines").setup()
    end
  }
}
