return {
  {
    "lukas-reineke/indent-blankline.nvim",
    ft = {"cpp", "c", "python", "json", "yaml", "lua"},
    config = function()
      require("ibl").setup {
        exclude = {filetypes = {"dashboard"}}
      }
    end
  }
}
