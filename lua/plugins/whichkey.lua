return {
	"folke/which-key.nvim",
	event = { "BufreadPre", "BufNewFile" },
	opts_extend = { "spec" },
	opts = {
		defaults = {},
		spec = {
			mode = { "n", "v" },
			{ "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
			{ "<leader>d", group = "Dashboard", icon = { icon = " ", color = "red" } },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.add({
			{ "<leader>f", group = "Telescope", desc = "Telescope" },
			{ "<leader>s", group = "Search Engine" },
			{ "<leader>q", group = "Quit/exit" },
			{ "<leader>t", group = "File template" },
		})
	end,
}
