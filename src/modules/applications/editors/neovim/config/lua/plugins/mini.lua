return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.ai").setup()
    require("mini.align").setup()
    require("mini.bracketed").setup()
    require("mini.cursorword").setup()
    require("mini.diff").setup()
    require("mini.extra").setup()
    require("mini.icons").setup()
    require("mini.move").setup()
    require("mini.operators").setup()
    require("mini.pairs").setup()
    require("mini.splitjoin").setup({
      mappings = {
        toggle = "<leader>m",
      },
    })
    require("mini.surround").setup({
      mappings = {
        add = "ys",
        find = "",
        replace = "cs",
        delete = "ds",
      },
    })
    require("mini.trailspace").setup()
  end
}
