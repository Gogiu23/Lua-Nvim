return {
	{
		"nvimdev/lspsaga.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("lspsaga").setup({
				lightbulb = {
					enable = true,
					sign = false,
				},
				move_in_saga = {
					prev = "<C-k>",
					next = "<C-j>",
				},
				finder_action_keys = {
					open = "<CR>",
				},
				definition_action_keys = {
					edit = "<CR>",
				},
			})
		end,
	},
}
