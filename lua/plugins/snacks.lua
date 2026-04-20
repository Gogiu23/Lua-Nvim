return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = {
				enabled = false,
			},
			explorer = {
				enabled = true,
				replace_netrw = true,
			},
			indent = { enabled = false },
			input = { enabled = true },
			picker = {
				enabled = true,
				sources = {
					explorer = {
						auto_close = true,
						jump = {
							close = true,
						},
					},
				},
			},
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = false },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
		keys = {
			{
				"<leader>e",
				function()
					Snacks.picker.explorer()
				end,
				desc = "File explorer",
			},
			{
				"<leader>p",
				function()
					Snacks.picker()
				end,
				desc = "Show Pickers  ",
			},
		},
	},
}
