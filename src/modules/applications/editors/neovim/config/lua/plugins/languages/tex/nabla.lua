return {
	"jbyuki/nabla.nvim",
	enabled = false,
	ft = { "norg", "org", "tex" },
	config = function(_, opts)
		local nabla = require "nabla"
		-- nabla.setup(opts)
		--[[ nabla.enable_virt {
      autogen = true,
      silent = true,
    } ]]
	end,
	keys = {
		{
			"<leader>k",
			function()
				require("nabla").popup()
			end,
			desc = "Open Nabla as popup",
		},
	},
}
