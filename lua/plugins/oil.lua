return {
	--Oil nvim
	{
		"stevearc/oil.nvim",
		-- keys = {
		-- 	{
		-- 		"-",
		-- 		function()
		-- 			local oil_open = false
		-- 			local Snack = require("snacks")
		-- 			if oil_open then
		-- 				oil_open = false
		-- 				Snack.dim.disable()
		-- 				require("oil").close()
		-- 			else
		-- 				oil_open = true
		-- 				require("oil").open_float(nil, nil, function()
		-- 					Snack.dim()
		-- 				end)
		-- 			end
		-- 		end,
		-- 		desc = " Toggle Oil Explorer",
		-- 	},
		-- },
		event = function()
			if vim.fn.argc() == 1 then
				return "ColorScheme"
			else
				return { "BufReadPre", "BufNewFile" }
			end
		end,
		opts = {},
		config = function()
			local detail = false

			require("oil").setup({
				keymaps = {
					["gd"] = {
						desc = "Toggle file detail view",
						callback = function()
							detail = not detail
							if detail then
								require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
							else
								require("oil").set_columns({ "icon" })
							end
						end,
					},
					["g?"] = { "actions.show_help", mode = "n" },
					["<C-s>"] = false,
					["<C-p>"] = "actions.preview",
					["<C-v>"] = "actions.select_vsplit",
					["<C-x>"] = "actions.select_split",
					["<BS>"] = { "actions.parent", mode = "n" },
					-- ["C-c"] = { "actions.close", mode = "n" },
					["g."] = { "actions.toggle_hidden", mode = "n" },
				},
				use_default_keymaps = false,
				float = {
					padding = 7,
					border = "rounded",
					win_options = {
						winblend = 10,
						winhighlight = "Normal:Normal,NormalFloat:NormalFloat",
					},
				},
			})
		end,
	},
}
