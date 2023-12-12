return {
	'folke/noice.nvim',
	event = "VeryLazy",
	opts = {},
	dependencies = {
		'MunifTanjim/nui.nvim',
		{
			'rcarriga/nvim-notify',
			config = function ()
				require("notify").setup({
					background_colour = "#17202A",
					fps = 30,
					icons = {
						DEBUG = "",
						ERROR = "",
						INFO = "",
						TRACE = "✎",
						WARN = ""
					},
					level = 2,
					minimum_width = 50,
					render = "compact",
					stages = "fade",
					timeout = 2000,
					top_down = true
				})
			end
		},
	},
	config = function ()
		require("noice").setup({
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
		})
	end
}
