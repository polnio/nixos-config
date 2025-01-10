return {
  "mfussenegger/nvim-dap",
  event = "BufRead",
  config = function()
    local dap = require "dap"

    local codelldb = {
      adapter = {
        type = "executable",
        command = "/usr/bin/lldb-vscode",
        name = "lldb",
      },
      config = {
        {
          name = "Launch",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      },
    }

    dap.adapters.lldb = codelldb.adapter
    dap.configurations.c = codelldb.config
    dap.configurations.cpp = codelldb.config
    dap.configurations.rust = codelldb.config
  end,
  keys = {
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle breakpoint",
    },
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Continue",
    },
  },
}
