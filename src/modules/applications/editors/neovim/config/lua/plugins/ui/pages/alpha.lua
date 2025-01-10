return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  opts = function()
    local dashboard = require "alpha.themes.dashboard"
    dashboard.section.header.val = {
      " ██▓███   ▒█████      ▄████▄   ▒█████  ",
      "▓██░  ██▒▒██▒  ██▒   ▒██▀ ▀█  ▒██▒  ██▒",
      "▓██░ ██▓▒▒██░  ██▒   ▒▓█    ▄ ▒██░  ██▒",
      "▒██▄█▓▒ ▒▒██   ██░   ▒▓▓▄ ▄██▒▒██   ██░",
      "▒██▒ ░  ░░ ████▓▒░   ▒ ▓███▀ ░░ ████▓▒░",
      "▒▓▒░ ░  ░░ ▒░▒░▒░    ░ ░▒ ▒  ░░ ▒░▒░▒░ ",
      "░▒ ░       ░ ▒ ▒░      ░  ▒     ░ ▒ ▒░ ",
      "░░       ░ ░ ░ ▒     ░        ░ ░ ░ ▒  ",
      "             ░ ░     ░ ░          ░ ░  ",
      "                     ░                 ",
    }
    dashboard.section.buttons.val = {
      dashboard.button("SPC n", "New file", ":ene <BAR> startinsert<cr>"),
      dashboard.button("SPC f f", "Find file", ":Telescope find_files<cr>"),
      dashboard.button("SPC f o", "Find recents", ":Telescope oldfiles<cr>"),
      dashboard.button("SPC p", "Find Project", ":ProjectMgr<cr>"),
    }
    -- dashboard.section.header.opts.hl = "DashboardHeader"
    return dashboard.opts
  end,
}
