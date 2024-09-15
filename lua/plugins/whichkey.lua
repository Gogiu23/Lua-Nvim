return {
	'folke/which-key.nvim',
	event = {"BufreadPre", "BufNewFile"},
	init = function ()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
		opt = {
			plugins = {
				spelling = true
			},
			win = {
				border = "single",
				position = "bottom",
				winblend = 10,
			}
		}
}
