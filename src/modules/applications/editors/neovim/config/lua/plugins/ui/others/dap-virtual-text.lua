return {
  "theHamsta/nvim-dap-virtual-text",
  dependencies = { "mfussenegger/nvim-dap" },
  event = "BufRead",
  config = function()
    require("nvim-dap-virtual-text").setup()
  end,
}
