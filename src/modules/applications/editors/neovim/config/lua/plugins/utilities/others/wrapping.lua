return {
	"andrewferrier/wrapping.nvim",
	config = function()
		require("wrapping").setup()
	end,
	cmd = { "HardWrapMode", "SoftWrapMode", "ToggleWrapMode" },
	event = "BufRead",
}
