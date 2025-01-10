return {
  "jmbuhr/otter.nvim",
  enabled = false,
  event = "InsertEnter",
  init = function()
    local otter = require "otter"
    otter.activate({ 'c' }, true, true, nil)
  end
}
