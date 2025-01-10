return {
  "nvim-neorg/neorg",
  run = ":Neorg sync-parsers",
  -- ft = { "norg" },
  event = "VeryLazy",
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
    },
  },
}
