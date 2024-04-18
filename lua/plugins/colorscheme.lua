return {
	{
		"Mofiqul/vscode.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			vim.o.background = "dark"
			-- vim.o.background = "light"
			local c = require("vscode.colors").get_colors()
			require("vscode").setup({
				-- style = "light",
				transparent = true,
				-- Enable italic comment
				italic_comments = true,
				-- Disable nvim-tree background color
				disable_nvimtree_bg = true,
				-- Override colors (see ./lua/vscode/colors.lua)
				color_overrides = {
					vscLineNumber = "#FFFFFF",
				},
				-- Override highlight groups (see ./lua/vscode/theme.lua)
				group_overrides = {
					-- this supports the same val table as vim.api.nvim_set_hl
					-- use colors from this colorscheme by requiring vscode.colors!
					Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
				},
			})
			require("vscode").load()
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = true,
				hide_inactive_statusline = true,
				lualine_bold = true,
			})
			vim.cmd([[colorscheme tokyonight-moon]])
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
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
			-- vim.cmd([[colorscheme catppuccin-macchiato]])
		end,
	},
}
