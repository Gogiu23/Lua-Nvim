return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"diff",
			"html",
			"css",
			"javascript",
			"jsdoc",
			"json",
			"jsonc",
			"lua",
			"graphql",
			"xml",
			"http",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"regex",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		},
		sync_install = false, -- true bloquea Neovim al arrancar, mejor false
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter").setup(opts)

		-- nvim-ts-autotag tiene su propio setup, independiente de treesitter
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = true,
			},
		})
	end,
}
