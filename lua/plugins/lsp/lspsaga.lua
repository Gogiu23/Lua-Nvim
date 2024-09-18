return {
	{
		"nvimdev/lspsaga.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("lspsaga").setup({
				symbol_in_winbar = {
					enable = true,
					separator = " > ",
					hide_keyword = true,
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
