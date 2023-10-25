return {
  {
    "lukas-reineke/indent-blankline.nvim",
    ft = {"cpp", "c", "python", "json", "yaml", "lua", "tex"},
    config = function()
      require("ibl").setup {
        exclude = {filetypes = {"dashboard"}},
        scope = {
          show_start = false,
          show_end = false
        }
      }
    end
  }
}
