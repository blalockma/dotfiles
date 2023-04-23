local dap = require("dap")
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")

dap.adapters.netcoredbg = {
  type = 'executable',
  command = mason_path  .. '/packages/netcoredbg/netcoredbg',
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
{
  type = "netcoredbg",
  name = "launch - netcoredbg",
  request = "launch",
  program = function()
    local cwd = vim.fn.getcwd()
    local d = vim.fn.fnamemodify(cwd, ":t")
    return vim.fn.input('Path to dll: ', cwd .. '/bin/Debug/net6.0/' .. d .. '.dll', 'file')
  end,
},
{
  type = "netcoredbg",
  name = "attach - netcoredbg",
  request = "attach",
  processId = function()
    local pid = require('dap.utils').pick_process()
    vim.fn.setenv('NETCOREDBG_ATTACH_PID', pid)
    return pid
  end,
},
}
