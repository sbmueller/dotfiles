return {
  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    cmd = "MarkdownPreview",
    build = function()
      vim.fn["mkdp#util#install"]()
    end
  }
}
