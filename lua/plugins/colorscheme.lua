return {
	-- "folke/tokyonight.nvim",
	"askfiy/visual_studio_code",
	lazy = false,
	priority = 1000,
	config = function ()
		-- vim.cmd([[colorscheme tokyonight]])
		vim.cmd([[colorscheme visual_studio_code]])
		require("visual_studio_code").setup({
			transparent = true,
		})
	end,
}
