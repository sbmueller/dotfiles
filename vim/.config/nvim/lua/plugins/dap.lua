return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "rcarriga/nvim-dap-ui", config = true },
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
    },
    keys = {
      {
        "<Leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Debug Toggle Breakpoint",
      },
      {
        "<Leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Debug Continue",
      },
      {
        "<Leader>dh",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Debug Hover",
      },
      {
        "<Leader>ds",
        function()
          require("dap").step_over()
        end,
        desc = "Debug Step Over",
      },
      {
        "<Leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Debug Step Into",
      },
      {
        "<Leader>do",
        function()
          require("dap").step_out()
        end,
        desc = "Debug Step Out",
      },
      {
        "<Leader>dw",
        function()
          require("dapui").toggle()
        end,
        desc = "Toggle Debug UI",
      },
      {
        "<Leader>de",
        function()
          require("dapui").eval()
        end,
        desc = "Evaluate Expression under Cursor",
      },
    },
    config = function()
      local dap = require("dap")
      dap.defaults.fallback.terminal_win_cmd = "vertical botright new"
      dap.adapters.lldb = {
        type = "executable",
        command = "lldb-dap",
        name = "lldb",
      }
      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "lldb",
          request = "launch",
          program = function()
            return require("dap.utils").pick_file({
              executables = true,
              path = vim.fn.getcwd() .. "/bazel-bin/",
            })
          end,
          args = function()
            local args_str = vim.fn.input({
              prompt = "Arguments: ",
              default = "--gtest_filter=*",
            })
            return vim.split(args_str, " +")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      require("dap.ext.vscode").load_launchjs(nil, { lldb = { "cpp", "c" } })
    end,
  },
}
