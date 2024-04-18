return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
	{
		"rest-nvim/rest.nvim",
		ft = {
			"http",
		},
		dependencies = { "luarocks.nvim" },
		config = function()
			require("rest-nvim").setup({
				highlight = {
					enable = true,
					timeout = 100,
				},
				keybinds = {
					{
						"<leader>rr",
						"<cmd>Rest run<CR>",
						"Rest run under the cursor",
					},
					{
						"<leader>rl",
						"<cmd>Rest run last<cr>",
						"Re-run last request",
					},
				},
			})
		end,
	},
}
