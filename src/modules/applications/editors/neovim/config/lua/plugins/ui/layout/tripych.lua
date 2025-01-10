return {
	'simonmclean/triptych.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	event = 'VeryLazy',
	config = true,
	cmd = 'Triptych',
	keys = { { '<leader>-', "<cmd>Triptych<cr>", { silent = true } } }
}
