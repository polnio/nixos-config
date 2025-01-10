return {
	"ThePrimeagen/git-worktree.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-telescope/telescope.nvim"
	},
	config = function()
		require("git-worktree").setup()
		require("telescope").load_extension("git_worktree")
	end,
	keys = {
		{
			"<leader>h",
			function()
				require("telescope").extensions.git_worktree.git_worktrees()
			end,
			desc = "Git Worktrees",
		}
	}
}
