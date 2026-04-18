return {
	{
		"stevearc/aerial.nvim",
		lazy = true,
		keys = {
			{ "<leader>aa", "<cmd>AerialToggle right<CR>", desc = "Aerial toggle" },
		},
		config = function()
			require("aerial").setup({})
		end,
	},
	--Oil nvim
	{
		"stevearc/oil.nvim",
		keys = {
			{ "-", "<CMD>Oil<CR>", desc = "Oil Explorer" },
		},
		event = function()
			if vim.fn.argc() == 1 then
				return "ColorScheme"
			else
				return { "BufReadPre", "BufNewFile" }
			end
		end,
		opts = {},
		config = function()
			require("oil").setup({
				keymaps = {
					["<C-s>"] = false,
					["<C-v>"] = "actions.select_vsplit",
					["<C-x>"] = "actions.select_split",
				},
			})
		end,
	},
}
