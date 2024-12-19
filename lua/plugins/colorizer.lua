return {
	{
		"brenoprata10/nvim-highlight-colors",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.opt.termguicolors = true
			require("nvim-highlight-colors").setup({
				render = "virtual",
				virtual_symbol = "■",
			})
		end,
	},
}
