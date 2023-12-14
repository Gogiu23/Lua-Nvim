return {
	{
		"dnlhc/glance.nvim",
		event = "InsertEnter",
		config = function()
			require("glance").setup({
				border = {
					enable = true,
				},
				theme = {
					enable = true,
					mode = 'brighten'
				}
			})
		end,
	},
}
