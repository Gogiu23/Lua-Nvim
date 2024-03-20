return {
	{
		"nvimdev/dashboard-nvim",
		event = function()
			if vim.fn.argc() == 0 then
				return "VimEnter"
			end
		end,
		cmd = "Dashboard",
		config = function()
			local dash = require("dashboard")
			local map = vim.keymap.set

			map("n", "<leader>d", ":Dashboard<CR>", { desc = "Dashboard" })
			vim.opt_global.showtabline = 2

			dash.setup({
				theme = "Hyper",
				shortcut_type = "number",
				config = {
					week_header = {
						enable = true,
						append = { "   " .. "May Be The Day to Avoid The Rabbit Hole" .. " 󰵼 " },
					},
					disable_move = false,
					hide = {
						statusline = true,
						tabline = false,
					},
					shortcut = {
						{
							desc = "󰒲  Lazy ",
							group = "@text.todo",
							action = "Lazy",
							key = "l",
						},
						{
							desc = "󰊳  Update Plugins ",
							group = "@property",
							action = "Lazy update",
							key = "u",
						},
						{
							icon = "  ",
							icon_hl = "@variable",
							desc = "Files",
							group = "Label",
							action = "Telescope find_files",
							key = "f",
						},
						{
							desc = "  Browse Files ",
							group = "DiagnosticHint",
							action = "Telescope file_browser",
							key = "a",
						},
						{
							desc = "  Chat GPT ",
							group = "Number",
							action = '!open "https://chat.openai.com/"',
							key = "c",
						},
					},
					project = {
						enable = false,
					},
					mru = {
						limit = 10,
						icon = "🗂️",
						label = " Recent files opened",
						cwd_only = true,
					},
					footer = { "🎱 Copyright Giuliano Dominici" }, -- footer
				},
			})
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
	},
}
