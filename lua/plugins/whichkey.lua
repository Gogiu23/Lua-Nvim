return {
	"folke/which-key.nvim",
	event = { "BufreadPre", "BufNewFile" },
	opts_extend = { "spec" },
	opts = {
		defaults = {},
		spec = {
			mode = { "n", "v" },
			{ "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
			{ "<leader>w", group = "Window" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.add({
			{ "<leader>f", group = "Telescope", desc = "Telescope" },
			{ "<leader>s", group = "Search Engine" },
		})
	end,
}
