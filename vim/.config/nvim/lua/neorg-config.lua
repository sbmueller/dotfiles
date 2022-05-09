require("neorg").setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.concealer"] = {
      config = {preset = "diamond"}
    },
    ["core.norg.journal"] = {
      config = {journal_folder = "~/notes/journal"}
    },
    ["core.norg.completion"] = {
      config = {engine = "nvim-cmp"}
    }
  }
}
