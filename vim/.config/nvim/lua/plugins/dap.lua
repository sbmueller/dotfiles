return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      {"rcarriga/nvim-dap-ui", config = true},
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio"
    },
    keys = {
      {"<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Debug Toggle Breakpoint"},
      {"<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", desc = "Debug Continue"},
      {"<Leader>dh", "<cmd>lua require('dap.ui.widgets').hover()<CR>", desc = "Debug Hover"},
      {"<Leader>ds", "<cmd>lua require('dap').step_over()<CR>", desc = "Debug Step Over"},
      {"<Leader>di", "<cmd>lua require('dap').step_into()<CR>", desc = "Debug Step Into"},
      {"<Leader>do", "<cmd>lua require('dap').step_out()<CR>", desc = "Debug Step Out"},
      {"<Leader>dw", "<cmd>lua require('dapui').toggle()<CR>", desc = "Toggle Debug UI"},
      {"<Leader>de", "<cmd>lua require('dapui').eval()<CR>", desc = "Evaluate Expression under Cursor"}
    },
    config = function()
      local dap = require("dap")
      dap.defaults.fallback.terminal_win_cmd = "vertical botright new"
      dap.adapters.lldb = {
        type = "executable",
        command = "lldb-dap", -- adjust as needed, must be absolute path
        name = "lldb"
      }
      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "lldb",
          request = "launch",
          program = function()
            return require("dap.utils").pick_file({executables = true, path = vim.fn.getcwd() .. "/bazel-bin/"})
          end,
          args = function()
            local args_str =
              vim.fn.input(
              {
                prompt = "Arguments: ",
                default = "--gtest_filter=*"
              }
            )
            return vim.split(args_str, " +")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false
        }
      }

      require("dap.ext.vscode").load_launchjs(nil, {lldb = {"cpp", "c"}})
    end
  }
}
