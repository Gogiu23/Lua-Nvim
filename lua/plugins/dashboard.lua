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

			map("n", "<leader>d", ":Dashboard<CR>", { desc = "Dashboard" })
			vim.opt_global.showtabline = 2

			dash.setup({
				theme = "doom",
				shortcut_type = "letter",
				config = {
					header = vim.split(logo, "\n"),
					-- 	week_header = {
					-- 		enable = true,
					-- 		append = { "   " .. "May Be The Day to Avoid The Rabbit Hole" .. " 󰵼 " },
					-- 	},
					-- disable_move = false,
					-- hide = {
					-- 	statusline = true,
					-- 	tabline = false,
					-- },
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
							action = "Telescope find_files",
							key = "f",
						},
						{
							icon = "⏲ ",
							desc = "Recent Files",
							action = "Telescope oldfiles",
							key = "r",
						},
						{
							desc = "  Browse Files ",
							group = "DiagnosticHint",
							action = "Telescope file_browser",
							key = "a",
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
					footer = function()
						local stats = require("lazy").stats()
						local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
						return {
							"🎱 Loaded " .. stats.loaded .. "/" .. stats.count .. " Plugins in " .. ms .. "ms",
						}
					end,
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
