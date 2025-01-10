return {
	'kaarmu/typst.vim',
	ft = 'typst',
	enabled = false,
	config = function()
		vim.g.typst_pdf_viewer = 'zathura'
		vim.g.typst_conceal = 1
		vim.g.typst_auto_open_quickfix = 0
	end
}
