return {
	'nvimdev/dashboard-nvim',
	event = "VimEnter",
	config = function ()
		local dash = require("dashboard")
		local map = vim.keymap.set

		map("n", "<leader>d", ":Dashboard<CR>", {desc = "Dashboard"})

		dash.setup({
			theme = 'hyper',
			config = {
				week_header = {
					enable = true,
				},
				disable_move = true,
				shortcut = {
					{
						desc = "󰒲  Lazy ",
						group = "@text.todo",
						action = "Lazy",
						key = "l"
					},
					{ 
						desc = '󰊳  Update Plugins ',
						group = '@property',
						action = 'Lazy update',
						key = 'u'
					},
					{
						icon = '  ',
						icon_hl = '@variable',
						desc = 'Files',
						group = 'Label',
						action = 'Telescope find_files',
						key = 'f',
					},
					{
						desc = '  Browse Files ',
						group = 'DiagnosticHint',
						action = 'Telescope file_browser',
						key = 'a',
					},
					{
						desc = '  Chat GPT ',
						group = 'Number',
						action = '!open "https://chat.openai.com/"',
						key = 'c',
					},
				},
				project = {
					enable = true,
					-- limit = 8,
					-- icon = '💻 ',
					-- label = ' Projects working on',
					-- action = 'Telescope find_files cwd=',
				},
				mru = {
					limit = 5,
					icon = '🗂️',
					label = ' Recent files opened',
					cwd_only = false 
				},
				footer = {"🎱 Copyright Giuliano Dominici"}, -- footer
			},
			shortcut_type = 'number',
		})
	end
}
