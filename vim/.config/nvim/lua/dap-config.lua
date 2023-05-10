local dap = require("dap")
dap.defaults.fallback.terminal_win_cmd = "vertical botright new"
dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "OpenDebugAD7"
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = false,
    setupCommands = {
      {
        text = "-enable-pretty-printing",
        description = "enable pretty printing",
        ignoreFailures = false
      }
    }
  }
}

vim.keymap.set("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {silent = true})
vim.keymap.set("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", {silent = true})
vim.keymap.set("n", "<Leader>dh", "<cmd>lua require('dap.ui.widgets').hover()<CR>", {silent = true})
vim.keymap.set("n", "<Leader>ds", "<cmd>lua require('dap').step_over()<CR>", {silent = true})
vim.keymap.set("n", "<Leader>do", "<cmd>lua require('dap').step_into()<CR>", {silent = true})
vim.keymap.set(
  "n",
  "<Leader>ds",
  function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
  end
)
