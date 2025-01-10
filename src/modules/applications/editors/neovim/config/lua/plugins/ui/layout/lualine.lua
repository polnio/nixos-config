return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function()
		-- local theme = require "lualine.themes.tokyonight"
		-- local theme = require "lualine.themes.catppuccin"
		--[[ local theme = require "lualine.themes.catppuccin"
		theme.normal.c.bg = "#1e1e2e" ]]

		local filename = require("lualine.components.filename"):extend()
		filename.apply_icon = require("lualine.components.filetype").apply_icon
		filename.icon_hl_cache = {}

		return {
			options = {
				icons_enabled = true,
				-- theme = theme,
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "", right = "" } },
				},
				lualine_b = {
					{ filename, colored = true },
					{ "branch", colored = true },
				},
				lualine_c = {},
				lualine_x = { "diagnostics" },
				lualine_y = { "progress" },
				lualine_z = {
					{ "location", separator = { left = "", right = "" }, icon = "" },
				},
			},
		}
	end,
}
