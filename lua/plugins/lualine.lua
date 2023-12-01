return {
	"nvim-lualine/lualine.nvim",
	dependencies = { 
		'nvim-tree/nvim-web-devicons', 
		opt = true 
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "vscode",
				icons_enabled = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {},
				globalstatus = true,
				refresh = {
					statusline = 100,
				},
			},
		})
	end,
}
