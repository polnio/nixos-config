return {
  'Bekaboo/dropbar.nvim',
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim'
  },
  event = "VeryLazy",
  keys = {
    {
      "<leader>=",
      function() require("dropbar.api").pick() end
    }
  }
}
