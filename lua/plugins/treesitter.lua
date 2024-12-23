return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local configs = require("nvim-treesitter.configs")
		local autotag = require("nvim-ts-autotag")
		configs.setup({
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
			sync_install = true,
			highlight = {
				enable = true,
			},
			-- autotag = {
			-- 	enable = true,
			-- 	enable_rename = true,
			-- 	enable_close = true,
			-- 	enable_close_on_slash = true,
			-- 	filetypes = {
			-- 		"html",
			-- 		"javascript",
			-- 	},
			-- 	skip_tags = {},
			-- },
		})
		autotag.setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = true,
			},
		})
	end,
}
