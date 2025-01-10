return {
  "imNel/monorepo.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    {
      "<leader>c",
      function()
        require("telescope").extensions.monorepo.monorepo()
      end,
      desc = "Manage monorepo"
    },
  },
}
