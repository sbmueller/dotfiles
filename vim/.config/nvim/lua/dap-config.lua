local dap = require("dap")
dap.defaults.fallback.terminal_win_cmd = "vertical botright new"
dap.adapters.lldb = {
  type = "executable",
  command = "lldb-vscode", -- adjust as needed, must be absolute path
  name = "lldb"
}
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {}
  }
}

require("dap.ext.vscode").load_launchjs(nil, {lldb = {"cpp", "c"}})

vim.keymap.set("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {silent = true})
vim.keymap.set("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", {silent = true})
vim.keymap.set("n", "<Leader>dh", "<cmd>lua require('dap.ui.widgets').hover()<CR>", {silent = true})
vim.keymap.set("n", "<Leader>ds", "<cmd>lua require('dap').step_over()<CR>", {silent = true})
vim.keymap.set("n", "<Leader>di", "<cmd>lua require('dap').step_into()<CR>", {silent = true})
vim.keymap.set("n", "<Leader>do", "<cmd>lua require('dap').step_out()<CR>", {silent = true})
vim.keymap.set("n", "<Leader>dw", "<cmd>lua require('dapui').toggle()<CR>", {silent = true})
