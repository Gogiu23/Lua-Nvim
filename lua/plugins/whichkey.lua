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
			{ "<leader>M", group = "Multicursor", icon = { icon = "󱢓 ", color = "purple" } },
			{ "<leader>g", group = "Git", icon = { icon = "󰊢 ", color = "orange" } },
			{ "<leader>l", group = "Definitions", icon = { icon = "󰟏 ", color = "yellow" } },
			{ "<leader>a", group = "Outline", icon = { icon = "󰙀 ", color = "green" } },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.add({
			{ "<leader>f", group = "Telescope", desc = "Telescope" },
			{ "<leader>s", group = "Noice, Google and GPT" },
			{ "<leader>q", group = "Quit/exit" },
			{ "<leader>t", group = "File template" },
		})
	end,
}
