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
			{ "<leader>a", group = "Outline", icon = { icon = "󰙀 ", color = "green" } },
			{ "<leader>l", group = "Lazy", icon = { icon = "󰒲 ", color = "cyan" } },
			{ "<leader>gl", group = "Lazygit", icon = { icon = "󰒲 ", color = "cyan" } },
			{ "<leader>sg", group = "Google", icon = { icon = "󰊯 ", color = "yellow" } },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.add({
			{ "<leader>f", group = "Telescope", desc = "Telescope" },
			{ "<leader>F", group = "Format", icon = { icon = "󰉶 ", color = "yellow" } },
			{ "<leader>s", group = "Noice, Google and GPT" },
			{ "<leader>q", group = "Quit/exit" },
			{ "<leader>t", group = "File template" },
			{ "<leader>L", group = "LSP", icon = { icon = "󰟏 ", color = "yellow" } },
			{ "<leader>h", group = "Help", icon = { icon = "󰞋 ", color = "yellow" } },
			{ "<leader>b", group = "Buffers", icon = { icon = " ", color = "cyan" } },
			{ "<leader>c", group = "Code" },
			{ "<leader>m", group = "Mason", icon = { icon = "󱈚 ", color = "blue" } },
		})
	end,
}
