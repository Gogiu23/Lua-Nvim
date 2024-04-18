return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("colorizer").setup({
			filetypes = {
				"*",
				cmp_docs = { always_update = true },
			},
			user_default_options = {
				mode = "background",
			},
		})
	end,
}
