return {
	"niuiic/typst-preview.nvim",
	dependencies = { "niuiic/core.nvim" },
	ft = { "typst" },
	keys = {
		{
			"<leader>n",
			function()
				require("typst-preview").preview()
			end,
			desc = "Typst Preview"
		}
	},
	opts = {
		preview = function(output_file)
			vim.loop.spawn("zathura", {
				args = { output_file },
			})
		end
	}
}
