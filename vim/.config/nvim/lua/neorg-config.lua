require("neorg").setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          notes = "~/notes" -- Format: <name_of_workspace> = <path_to_workspace_root>
        },
        autochdir = true, -- Automatically change the directory to the current workspace's root every time
        index = "index.norg" -- The name of the main (root) .norg file
      }
    },
    ["core.norg.concealer"] = {
      config = {icon_preset = "varied"}
    },
    ["core.norg.journal"] = {
      config = {journal_folder = "~/notes/journal"}
    },
    ["core.norg.completion"] = {
      config = {engine = "nvim-cmp"}
    },
    ["core.presenter"] = {
      config = {zen_mode = "zen-mode"}
    },
    ["core.export"] = {},
    ["core.export.markdown"] = {}
  }
}
