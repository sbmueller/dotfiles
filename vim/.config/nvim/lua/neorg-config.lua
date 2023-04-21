require("neorg").setup {
  load = {
    ["core.defaults"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          notes = "~/notes" -- Format: <name_of_workspace> = <path_to_workspace_root>
        },
        autochdir = true, -- Automatically change the directory to the current workspace's root every time
        index = "index.norg" -- The name of the main (root) .norg file
      }
    },
    ["core.concealer"] = {
      config = {icon_preset = "varied"}
    },
    ["core.journal"] = {
      config = {journal_folder = "~/notes/journal"}
    },
    ["core.completion"] = {
      config = {engine = "nvim-cmp"}
    },
    ["core.presenter"] = {
      config = {zen_mode = "zen-mode"}
    },
    ["core.export"] = {},
    ["core.export.markdown"] = {}
  }
}
