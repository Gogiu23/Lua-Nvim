return {
	{
		"nvimdev/dashboard-nvim",
		event = function()
			if vim.fn.argc() == 0 then
				return "VimEnter"
			end
		end,
		keys = {
			{ "<leader>d", "<cmd>Dashboard<cr>", desc = "Dashboard " },
		},
		cmd = "Dashboard",
		config = function()
			local dash = require("dashboard")
			local logo = [[
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- ~ ██████╗  ██████╗  ██████╗ ██╗██╗   ██╗~
-- ~██╔════╝ ██╔═══██╗██╔════╝ ██║██║   ██║~
-- ~██║  ███╗██║   ██║██║  ███╗██║██║   ██║~
-- ~██║   ██║██║   ██║██║   ██║██║██║   ██║~
-- ~╚██████╔╝╚██████╔╝╚██████╔╝██║╚██████╔╝~
-- ~ ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝ ╚═════╝ ~
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			]]
			logo = string.rep("\n", 8) .. logo .. "\n\n"

			vim.opt_global.showtabline = 2

			dash.setup({
				theme = "doom",
				shortcut_type = "letter",
				config = {
					header = vim.split(logo, "\n"),
					center = {
						{
							desc = "󰎔 New file",
							action = "enew",
							key = "n",
						},
						{
							icon = " ",
							icon_hl = "@variable",
							desc = "Find Files",
							group = "Label",
							action = "Telescope file_browser",
							key = "f",
						},
						{
							icon = "⏲ ",
							desc = "Recent Files",
							action = "Telescope oldfiles",
							key = "r",
						},
						{
							desc = "󰆓 Saved Sessions",
							action = "Telescope xray23 list",
							key = "s",
						},
						{
							desc = "󰒲  Lazy ",
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
							desc = "  Chat GPT ",
							group = "Number",
							action = '!open "https://chat.openai.com/"',
							key = "g",
						},
						{
							desc = " Config",
							action = "Telescope file_browser path=$HOME/.config/nvim",
							key = "c",
						},
						{
							desc = "󰗼 Quit",
							group = "Number",
							action = "q",
							key = "q",
						},
					},
				},
			})
		end,
		dependencies = {
			{
				"echasnovski/mini.icons",
				"nvim-tree/nvim-web-devicons",
				config = function()
					require("nvim-web-devicons").setup({
						color_icons = true,
						default = false,
					})
				end,
			},
		},
	},
}
