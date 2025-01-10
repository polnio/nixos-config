return {
  "catppuccin/nvim",
  enabled = true,
  name = "catppuccin",
  priority = 1000,
  opts = {
    custom_highlights = function()
      return {}
    end,
  },
  init = function()
    vim.cmd.colorscheme "catppuccin-mocha"
  end
}
