return {
	'folke/which-key.nvim',
	event = {"BufreadPre", "BufNewFile"},
	init = function ()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
		opts = {
			plugins = {
				spelling = true
			},
			window = {
				border = "single",
				position = "top",
				winblend = 10,
			}
		}
}
