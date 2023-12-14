return {
	--Kotlin nvim
	{
		"udalov/kotlin-vim",
		ft = "kt",
	},

	--Comment.nvim
	{
		"numToStr/Comment.nvim",
		event = "BufReadPre",
		opts = {},
		config = function()
			require("Comment").setup({
				padding = true,
				sticky = true,
				ignore = nil,
				toggler = { line = "gcc", block = "gbc" },
				opleader = { line = "gc", block = "gb" },
				extra = { above = "gcO", below = "gco", eol = "gcA" },
				mappings = { basic = true, extra = true },
				pre_hook = nil,
				post_hook = nil,
			})
		end,
	},

	--Bracey (liveserver)
	{
		"turbio/bracey.vim",
		ft = "html",
	},
	{
		-- highlight the tag corresponding
		"gregsexton/MatchTag",
		ft = "html",
	},

	--Floatterm
	{
		"voldikss/vim-floaterm",
		keys = {
			{ "<leader>t", ":FloatermToggle<CR>", desc = "floaterm" },
		},
		config = function()
			vim.cmd([[tnoremap <leader>t <C-\><C-n>:FloatermToggle<CR>]])
		end,
	},

	--Dressing library
	{
		"stevearc/dressing.nvim",
		event = "BufReadPre",
	},
	{
		"folke/neoconf.nvim",
		event = { "BufReadPre", "BufNewFile" },
		cmd = "Neoconf",
	},
	{
		"folke/neodev.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
}
