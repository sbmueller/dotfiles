return {
  {
    "selimacerbas/markdown-preview.nvim",
    dependencies = { "selimacerbas/live-server.nvim" },
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewRefresh" },
    ft = { "markdown" },
    opts = {
      default_theme = "dark",
      debounce_ms = 300,
    },
  },
}
