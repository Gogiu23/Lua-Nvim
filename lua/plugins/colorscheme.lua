return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = true,
				hide_inactive_statusline = false,
				lualine_bold = true,
			})
			-- vim.cmd([[colorscheme tokyonight-moon]])
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato",
				transparent_background = true,
				default_integrations = true,
				integrations = {
					treesitter = true,
					notify = true,
					mason = true,
					noice = true,
					which_key = true,
				},
			})
			vim.cmd([[colorscheme catppuccin-macchiato]])
		end,
	},
}
