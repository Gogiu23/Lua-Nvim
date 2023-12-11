return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = {"BufReadPre", "BufNewFile"},
	dependencies = {
		'windwp/nvim-ts-autotag',
	},
	config = function ()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"lua",
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
			sync_install = false,
			highlight = { 
				enable = true 
			},
			autotag = {
				enable = true,
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = true,
				filetypes = {
					'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
					'xml',
					'php',
					'markdown',
					'astro', 'glimmer', 'handlebars', 'hbs'
				},
				skip_tags = {
					'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
					'input', 'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr','menuitem'
				}
			},

		})
	end,
}
